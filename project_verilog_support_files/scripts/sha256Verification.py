import hashlib
import argparse

mask = 0xFFFFFFFF
numberOfBitsPerWord = 32

def Ch(x,y,z):
	return ((x&y)^((~x)&z))&mask

def Maj(x,y,z):
	return ((x&y)^(x&z)^(y&z))&mask

def RotR(x,n):
	# if n is larger than the number of bits, take the modular
	n = n%numberOfBitsPerWord
	# Convert the number into a 32-bit binary string
	xstr = '{0:032b}'.format(x)
	strLen = len(xstr)
	# Do the circular right shift
	xstr = xstr[(strLen-n):(strLen)]+xstr[0:(strLen-n)]
	# Convert the shifted string back to integer and return it
	return int(xstr,2)&mask

def ShR(x,n):
	# if n is larger than the number of bits, take the modular
	n = n%numberOfBitsPerWord
	# Convert the number into a 32-bit binary string
	xstr = '{0:032b}'.format(x)
	strLen = len(xstr)
	# Do the right shift
	xstr = xstr[0:(strLen-n)]
	# Convert the shifted string back to integer and return it
	return int(xstr,2)&mask

def addition(x): # x is a list of integers
	y = 0
	for xx in x:
		y = (y+xx)%(2**32)
	return y

def concat(x):
	xstr = ""
	# Convert all the numbers in list x into 32-bit binary strings and concatenate them
	for y in x:
		xstr+='{0:032b}'.format(y)
	# Convert the concatenated string back to integer and return it
	return int(xstr,2)

def capitalSigma0(x):
	return (RotR(x,2)^RotR(x,13)^RotR(x,22))&mask

def capitalSigma1(x):
	return (RotR(x,6)^RotR(x,11)^RotR(x,25))&mask

def sigma0(x):
	return (RotR(x,7)^RotR(x,18)^ShR(x,3))&mask

def sigma1(x):
	return (RotR(x,17)^RotR(x,19)^ShR(x,10))&mask

def convertTo512Bits(stringInput):
	print("**************Step 1: padding**************\n")
	# Convert the text into utf-8 code
	byteCode = stringInput.encode()
	# Caculate how many bytes are necessary for the data, padded 0s, and length
	numberOfBytes = len(byteCode)
	totalNumberOfBytes = int(512/8)
	numberOfBytesForLen = int(64/8)
	numberOfBytesFor0s = totalNumberOfBytes - numberOfBytes - numberOfBytesForLen
	output = ""
	# Convert the data into 8-bit binary strings and concatenate them
	for number in byteCode:
		output+='{0:08b}'.format(number)
	print("The {0}-byte signal \'{1}\' converted to binary forms is:\n\t{2}\n".format(numberOfBytes,stringInput,output))
	print("First, append a \'1\' at the end:\n\t{0}\n".format(output+'1'))
	# Pad zeros
	for i in range(numberOfBytesFor0s):
		if i==0:
			output+='10000000'
		else:
			output+='00000000'
	# Pad length (a 64-bit integer)
	print("Second, append {0} \'0\'s at the end so that the sigal is 448 bits:\n\t{1}\n".format(numberOfBytesFor0s*8-1,output))
	output+='{0:064b}'.format(numberOfBytes*8)
	print("Finally, append the length (number of bits: {0}) of the message \'{1}\' as a 64-bit integer so that the final message has 512 bits:\n\t{2}\n".format(numberOfBytes*8,stringInput,output))
	print("The message is 0x{0:0128x} in hexidecimal format\n".format(int(output,2)))
	return output

def XunsSha256(binary512bits):
	K = [0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2]
	H1 = 0x6a09e667
	H2 = 0xbb67ae85
	H3 = 0x3c6ef372
	H4 = 0xa54ff53a
	H5 = 0x510e527f
	H6 = 0x9b05688c
	H7 = 0x1f83d9ab
	H8 = 0x5be0cd19
	W64 = []
	# The first 16 words are obtained by splitting M in 32-bit blocks
	print("**************Step 2: block decomposition**************\n")
	hexForm = "0x{0:0128x}".format(int(binary512bits,2))
	print("Now decompose the following 512-bit message into 16 32-bit blocks:\n\t{0}\n".format(hexForm))
	for i in range(16):
		numberInBinaryString = binary512bits[(i*32):((i+1)*32)]
		W64.append(int(numberInBinaryString,2))
		print("Block {0} is {1}".format(i+1,"0x{0:08x}".format(W64[i])))
	# Obtain the other 48 blocks
	print("\nNow continue calculating the rest 48 blocks:\n")
	for i in range(16,64):
		w = addition([sigma1(W64[i-2]),W64[i-7],sigma0(W64[i-15]),W64[i-16]])
		W64.append(w)
		print("Block {0} is {1}".format(i+1,"0x{0:08x}".format(W64[i])))
	print("\n**************Step 3: Hash computation**************\n")
	print("Now initialize variable a - h\n")
	a,b,c,d,e,f,g,h = H1,H2,H3,H4,H5,H6,H7,H8
	print("a: 0x{0:08x}".format(a))
	print("b: 0x{0:08x}".format(b))
	print("c: 0x{0:08x}".format(c))
	print("d: 0x{0:08x}".format(d))
	print("e: 0x{0:08x}".format(e))
	print("f: 0x{0:08x}".format(f))
	print("g: 0x{0:08x}".format(g))
	print("h: 0x{0:08x}".format(h))

	print("\nNow enter the 64-iteration loop")
	for i in range(64):
		T1 = addition([h,capitalSigma1(e),Ch(e,f,g),K[i],W64[i]])
		T2 = addition([capitalSigma0(a),Maj(a,b,c)])
		h = g
		g = f
		f = e
		e = addition([d,T1])
		d = c
		c = b
		b = a
		a = addition([T1,T2])
		print("\nEnd of iteration {0}".format(i+1))
		print("a: 0x{0:08x}".format(a))
		print("b: 0x{0:08x}".format(b))
		print("c: 0x{0:08x}".format(c))
		print("d: 0x{0:08x}".format(d))
		print("e: 0x{0:08x}".format(e))
		print("f: 0x{0:08x}".format(f))
		print("g: 0x{0:08x}".format(g))
		print("h: 0x{0:08x}".format(h))
		print("T1: 0x{0:08x}".format(T1))
		print("T2: 0x{0:08x}".format(T2))
	print("\nFinished the 64-iteration loop")
	H1 = addition([H1,a])
	H2 = addition([H2,b])
	H3 = addition([H3,c])
	H4 = addition([H4,d])
	H5 = addition([H5,e])
	H6 = addition([H6,f])
	H7 = addition([H7,g])
	H8 = addition([H8,h])
	print("H1: 0x{0:08x}".format(H1))
	print("H2: 0x{0:08x}".format(H2))
	print("H3: 0x{0:08x}".format(H3))
	print("H4: 0x{0:08x}".format(H4))
	print("H5: 0x{0:08x}".format(H5))
	print("H6: 0x{0:08x}".format(H6))
	print("H7: 0x{0:08x}".format(H7))
	print("H8: 0x{0:08x}\n".format(H8))
	return concat([H1,H2,H3,H4,H5,H6,H7,H8])



if __name__ =="__main__":
	parser = argparse.ArgumentParser()
	parser.add_argument("stringInput",help="Text to be hashed with sha256")
	args = parser.parse_args()
	# Extract the input string
	stringInput = args.stringInput
	print("The string you input is: {0}\n".format(stringInput))
	# Convert the string to 512-bit block
	binaryRepresentation512Bits = convertTo512Bits(stringInput)
	# Calculate the result and convert it to a hex string
	result = '{0:064x}'.format(XunsSha256(binaryRepresentation512Bits))
	print("sha256 result: " + result)
	# Calculate the result with the built-in library
	correctResult = hashlib.sha256(stringInput.encode()).hexdigest()
	print("reference result: " + correctResult)
	if result == correctResult:
		print("The results match")
	else:
		print("The results are different from each other, please check your implementation")

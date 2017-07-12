def numword num
		singles	=	['one',		'two',		'three',
					'four',		'five',		'six',
					'seven',	'eight',	'nine']
		
		ten_place =	['ten',		'twenty',	'thirty',
					'forty',	'fifty',	'sixty',
					'seventy',	'eighty',	'ninety']
		
		teens 	=	['eleven',	'twelve',	'thirteen',
					'fourteen',	'fifteen',	'sixteen',
					'seventeen', 'eighteen', 'nineteen']

	arr = []

	8.times do
		arr.push (num % 10)
		num = num / 10
	end

	units = arr[0]
	tens = arr[1]
	hund = arr[2]
	thous = arr[3]
	ten_thous = arr[4]
	hund_thous = arr[5]
	mill = arr[6]
	ten_mill = arr[7]

	num_sequ = ''
	
	if (units + tens + hund + thous + ten_thous + hund_thous + mill + ten_mill) == 0
		return puts 'Zero'
	end
	
	if ten_mill > 0
		if ((ten_mill == 1) && (mill > 0))
			tenmillsequ = teens[mill-1]
		else
			tenmillsequ = ten_place[ten_mill-1]
		end
		num_sequ = tenmillsequ + ' '
	end

	if ((mill > 0) && (ten_mill != 1))
		millsequ = singles[mill-1]
		num_sequ = num_sequ + millsequ + ' '
	end

	if ((ten_mill > 0) || (mill > 0))
		num_sequ = num_sequ + 'million '
	end
		

	if hund_thous > 0
		hundthoussequ = singles[hund_thous-1]
		num_sequ = num_sequ + hundthoussequ + ' hundred '
	end

	if ten_thous > 0
		if ((ten_thous == 1) && (thous > 0))
			tenthoussequ = teens[thous-1]
		else
			tenthoussequ = ten_place[ten_thous-1]
		end
		num_sequ = num_sequ + tenthoussequ + ' '
	end

	if ((thous > 0) && (ten_thous != 1))
		thoussequ = singles[thous-1]
		num_sequ = num_sequ + thoussequ + ' '
	end

	if ((hund_thous > 0) || (ten_thous > 0) || (thous > 0))
		num_sequ = num_sequ + 'thousand '
	end

	if hund > 0
		hundsequ = singles[hund-1]
		num_sequ = num_sequ + hundsequ + ' hundred '
	end

	if tens > 0
		if ((tens == 1) && (units > 0))
			tensequ = teens[units-1]
		else
			tensequ = ten_place[tens-1]
		end
		num_sequ = num_sequ + tensequ + ' '
	end

	if ((units > 0) && (tens != 1))
		unitsequ = singles[units-1]
		num_sequ = num_sequ + unitsequ
	end

	puts num_sequ.capitalize
end

puts 'I can convert a number from 0 to 99,999,999 into English.  Give me a try!'
puts

while true
	n = gets.chomp
	if n == ''
		break
	end
	
	n = n.to_i
	if (n < 0) or (n > 99999999)
		puts
		puts 'Please enter a number from 0 to 99,999,999'
	else
		puts
		numword n
		puts
	end
end
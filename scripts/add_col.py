#   add_col.py Script
#   Add column difference at the end of a .csv table
#   Tommaso Diotalevi

import csv
import getopt
import sys
import logging
import types
import os

FORMAT = '%(levelname)s - %(funcName)s - %(lineno)d: %(message)s'
logging.basicConfig(level=logging.INFO, format=FORMAT)
logger = logging.getLogger(__name__)

def csv_adder(input_file, output_file, header_name1, header_name2):
	with open(input_file, 'rb') as inf, open(output_file, 'wb') as outf:
		logger.info('Reading original .csv: %s', input_file)
		reader = csv.reader(inf)
		all = []
		row = next(reader) 
		#csvreader = csv.DictReader(inf)
		#fieldnames = [header_name] + csvreader.fieldnames 
		#csvwriter = csv.DictWriter(outf, fieldnames)
		logger.info('Writing new .csv: %s', output_file)
		writer = csv.writer(outf, lineterminator = '\n')
		row.append(header_name1 + "_minus_" + header_name2)
		all.append(row)
		i = row.index(header_name1)
		j = row.index(header_name2)
		for row in reader:
			if (int(row[i]) or int(row[j])) == -1:
				row.append(-1)
			elif (int(row[i]) or int(row[j])) == -2:
				row.append(-2)
			elif (int(row[i]) or int(row[j])) == -3:
				row.append(-3)
			else:
				row.append(int(row[i])-int(row[j]))
			all.append(row)
		writer.writerows(all)
		#csvwriter.writeheader()
		#for row in enumerate(csvreader, 1):
		#	csvwriter.writerow(row)		
		outf.close()
		logger.info('Closing output file')

def main(argv):	
	global inputfile, outputfile, column, column2
	message= 'Add columns to the .csv file in order to perform ML \n' \
                 'To run: \n' \
                 'python add_col.py --ifile <inputfile.csv> --ofile<outputfile.csv>\n\n' \
	         '-h shows this help\n'\
                 '--ifile/-i: input file\n'\
                 '--ofile/-o: output file\n' 	

	try:
		opts, args=getopt.getopt(argv, "hi:o:", ["ifile=", "ofile=", "col1=", "col2="])
	except getopt.GetoptError:
		print('ERROR:Wrong arguments'
                      'run \'add_col.py -h\' for more info')
		sys.exit(2)
	for opt, arg in opts:
		if opt == '-h':
			print(message)
			sys.exit(2)
		elif opt in ("-i", "--ifile"):
			inputfile = arg
		elif opt in ("-o", "--ofile"):
			outputfile = arg
		elif opt in ("-c1", "--col1"):
			column = arg
		elif opt in ("-c2", "--col2"):
			column2 = arg
	if not (inputfile and outputfile and column):
		print('You should provide an input file and an output file,' 'run \'add_col.py -h\' for more info')
		sys.exit(2)
	logger.info('Initiating adding function')
	csv_adder(inputfile, outputfile, column, column2)


if __name__ == '__main__':
	main(sys.argv[1:])

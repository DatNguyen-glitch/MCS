import re

problem_cell = ["FAx1_ASAP7_75t_R","HAxp5_ASAP7_75t_R"] #need CON pin before output

#SUBCKT FAx1_ASAP7_75t_R VSS VDD A B CI CON SN
#FA needs 5 inputs and 1 output
#HA needs 3 inputs and 1 output

TIME_RESOLUTION = 5

file = input("Input file name (don't include file format)")
#file = "MUL"

fin =  open(file+".sp", "r")
fout = open(file+"_new.sp","w")
content_new = fin.readlines()
flag=1
index = 0
append_index = 0
counter = 0
for line in content_new:
	append_string = "CIN_"+ str(append_index)
	temp = line.split()
	if(len(temp)>1):
		if((temp[len(temp)-1]=="FAx1_ASAP7_75t_R")):
			if(len(temp) == 6):
				print("modify FA 4 pin \n")
				temp.insert(len(temp)-1, append_string+' VDD VSS ')
				append_index = append_index + 1
			else: 
				print("modify FA 5 pin \n")
				temp.insert(len(temp)-1, ' VDD VSS ')
		else:
			if(counter!=0):
				temp.insert(len(temp)-2 ,'VDD VSS ')
			else:
				temp.insert(2,'VDD VSS ')
		newLine = ' '.join(temp)
		#print(newLine)
		fout.write(newLine)
		fout.write('\n')
	else:
		fout.write(line)
	counter = counter + 1

fout.close()
fin.close()
         

         


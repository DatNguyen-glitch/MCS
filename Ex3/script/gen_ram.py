import sys
import random as rd

def gen_ram(num_cell):
   vdd = 0.7
   num_col = 8
   
   filename = "spice/sram_arr" + str(num_cell) + ".sp"

   with open(filename, "w") as f:
      f.write(f".subckt sram_arr{num_cell} VDD VSS BL BLB\n")
   
   f = open(filename, "a")
   for ix in range (int(num_cell/num_col)):
      f.write(f"+")
      for iy in range(num_col):
         f.write(f" wl[{ix*8 + iy}]")
         if (iy == num_col-1):
            f.write(f"\n")

   for iz in range (num_cell):
      f.write(f"x_cell{iz} VDD VSS wl[{iz}] BL BLB sram_6t\n")
   f.write(f".ends\n")
   
   f.write(f".subckt buffer_arr{num_cell} VDD VSS clk\n")
   for ix in range (int(num_cell/num_col)):
      f.write(f"+")
      for iy in range(num_col):
         f.write(f" in[{ix*8 + iy}]")
         if (iy == num_col-1):
            f.write(f"\n")

   for ix in range (int(num_cell/num_col)):
      f.write(f"+")
      for iy in range(num_col):
         f.write(f" out[{ix*8 + iy}]")
         if (iy == num_col-1):
            f.write(f"\n")

   for iz in range (num_cell):
      f.write(f"x_buf{iz} VDD VSS in[{iz}] out[{iz}] buffer\n")
      f.write(f"x_and{iz} VSS VDD in[{iz}] clk out[{iz}] AND2x2_ASAP7_75t_SRAM\n")
   f.write(f".ends\n")

   for ic in range(num_cell):
      if (rd.randint(0, 1) == 1):
         f.write(f".nodeset v(x_sram_arr0.x_cell{ic}.q) = v_vdd\n")
      else:
         f.write(f".nodeset v(x_sram_arr0.x_cell{ic}.q) = 0\n")

   f.close()

def gen_top(num_cell):
   num_col = 8
   f = open("spice/testbed.sp", "a")

   f.write(f"x_sram_arr0 vdd gnd bl blb\n")
   for ix in range (int(num_cell/num_col)):
      f.write(f"+")
      for iy in range(num_col):
         f.write(f" wl[{ix*8 + iy}]")
         if (iy == num_col-1):
            f.write(f"\n")
   f.write(f"+ sram_arr{num_cell}\n")

   f.write(f"x_buffer_arr0 vdd gnd clk\n")
   for ix in range (int(num_cell/num_col)):
      f.write(f"+")
      for iy in range(num_col):
         f.write(f" in[{ix*8 + iy}]")
         if (iy == num_col-1):
            f.write(f"\n")
   for ix in range (int(num_cell/num_col)):
      f.write(f"+")
      for iy in range(num_col):
         f.write(f" wl[{ix*8 + iy}]")
         if (iy == num_col-1):
            f.write(f"\n")
   f.write(f"+ buffer_arr{num_cell}\n")

   f.write(f".LPRINT (0.3 0.32) v(clk)")
   for ix in range (int(num_cell/num_col)):
      f.write(f"\n+")
      for iy in range(num_col):
         f.write(f" v(wl[{ix*8 + iy}])")
   for ix in range (int(num_cell/num_col)):
      f.write(f"\n+")
      for iy in range(num_col):
         f.write(f" v(in[{ix*8 + iy}])")
   f.write(f"\n.end")

def line_decoder(input_number, base):
    binary_bit = ['0'] * base
    
    # Set the bit at the index specified by input_number to '1'
    binary_bit[base - input_number -1] = '1'
    
    # Join the list into a single string
    return ''.join(binary_bit)



def gen_vec(num_cell):
   pat_num = 10
   prd = 1
   tr = 0.05
   tf = 0.05
   td = 0
   vih = 0.7
   vil = 0.0   
   vth = 0.4
   slope = 0.1
   f = open("spice/vector_" + str(num_cell) + ".vec", "w")
   f.write(f"RADIX")
   for ix in range (int(num_cell/16)):
      f.write(f" 4444")
   f.write(f"\nVNAME in[[{num_cell-1}:0]]")
   f.write(f"\nIO")
   for ix in range (int(num_cell/16)):
      f.write(f" IIII")
   f.write(f"\ntunit ns \nperiod {prd}\ntfall {tf}\ntrise {tr}")
   f.write(f"\ntdelay {td}\nvih {vih}\nvil {vil}\nvth {vth}\nslope {slope}\n")
  
   base = 128

   for ix in range (pat_num):
      ran_num = rd.randint(0, 8)
      binary_bit = line_decoder(ran_num, base)
      hex_num = hex(int(binary_bit, 2))[2:].zfill(int(base/4))
      print (f"number: {ran_num}, hex_pat: {hex_num}")
      for ix in range (int(num_cell/4)):
         if ((ix%4 == 0) & (ix != 0)):
            f.write(f" ")
         f.write(f"{hex_num[ix]}")
      f.write(f"\n")

   f.close()

def main():
   num_cell = int(sys.argv[1])
   gen_ram(num_cell)
   gen_top(num_cell)
   gen_vec(num_cell)

if __name__ == "__main__":
   main()


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/04/2019 10:06:45 AM
-- Design Name: 
-- Module Name: hadder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hadder is
    Port ( a : in STD_LOGIC_VECTOR(15 downto 0);
           b : in STD_LOGIC_VECTOR(15 downto 0);
           sum : out STD_LOGIC_VECTOR(15 downto 0);
           cout : out STD_LOGIC);
end hadder;

architecture Behavioral of hadder is

signal temp_sum: STD_LOGIC_VECTOR(16 downto 0):=(others=>'0');

begin
process(a,b)
    begin
    temp_sum <= STD_LOGIC_VECTOR(('0' & unsigned(a)) + ('0'& unsigned(b)));
--    for i in 0 to 15 loop
--             temp_sum(i) <= a(i) xor b(i);
--    end loop;
end process;

cout <= temp_sum(16);
--a(15) and b(15); 
sum <= temp_sum(15 downto 0);
--temp_sum;

end Behavioral;

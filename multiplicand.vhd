----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/05/2019 09:56:29 AM
-- Design Name: 
-- Module Name: multiplicand - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplicand is
Port (clk,rst: in STD_LOGIC;
      sin : in STD_LOGIC_VECTOR(15 downto 0);
      s_out: out STD_LOGIC_VECTOR(15 downto 0));
end multiplicand;

architecture Behavioral of multiplicand is

signal temp: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');

begin

process (clk,rst,sin)
    begin
        if (rst = '1') then
            temp <= (others => '0');
        elsif clk'event and clk='1' then
            temp <= sin;
       end if;
end process;
s_out <= temp;

end Behavioral;

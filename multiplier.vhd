----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/07/2019 12:58:50 PM
-- Design Name: 
-- Module Name: multiplier - Behavioral
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

entity multiplier is
 Port (clk, rst, ld_en: in STD_LOGIC;
       si: in STD_LOGIC_VECTOR(15 downto 0);
       sout: out STD_LOGIC);
end multiplier;

architecture Behavioral of multiplier is

signal temp: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');

begin

process (clk,rst,si,ld_en)
    begin
        if (rst ='1') then
            temp <= (others => '0');
            elsif (rising_edge(clk)) then
                if (ld_en = '1') then
                    temp <= si;
                else
                    temp <= '0' & temp(15 downto 1);
          end if;
       end if;
end process;
sout <= temp(0);

end Behavioral;

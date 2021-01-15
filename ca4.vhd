----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2019 11:36:55 AM
-- Design Name: 
-- Module Name: ca4 - Behavioral
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

entity ca4 is
  Port (clk, rst, mult_en: in STD_LOGIC;
        x, y: in STD_LOGIC_VECTOR(15 downto 0);
        product: out STD_LOGIC_VECTOR(31 downto 0));
end ca4;

architecture Behavioral of ca4 is

component hadder is
     Port ( a : in STD_LOGIC_VECTOR(15 downto 0);
            b : in STD_LOGIC_VECTOR(15 downto 0);
            sum : out STD_LOGIC_VECTOR(15 downto 0);
            cout : out STD_LOGIC);--_VECTOR(15 downto 0));
end component;

component multiplier is
    Port (clk,rst,ld_en: in STD_LOGIC;
          si : in STD_LOGIC_VECTOR(15 downto 0);
          sout: out STD_LOGIC);
end component;

component multiplicand is
Port (clk,rst: in STD_LOGIC;
      sin : in STD_LOGIC_VECTOR(15 downto 0);
      s_out: out STD_LOGIC_VECTOR(15 downto 0));
end component;

component DWPP is
    Port ( clk : in STD_LOGIC;
           rst: in STD_LOGIC;
           cin: in STD_LOGIC;
           d : in STD_LOGIC_VECTOR(15 downto 0);
           q_hadder : out STD_LOGIC_VECTOR(15 downto 0);
           q_product : out STD_LOGIC_VECTOR(31 downto 0));
end component;


signal xj, hadder_cout: STD_LOGIC:='0';
signal mux_a, multiplicand_out, add_cout, DWPP_out,hadder_sum: STD_LOGIC_VECTOR(15 downto 0);
signal final_output: STD_LOGIC_VECTOR(31 downto 0);
begin


multiplier_x:  multiplier port map(clk => clk, rst => rst, ld_en => mult_en, si => x, sout => xj);
Multiplicand_a: multiplicand port map(clk => clk, rst => rst, sin => y, s_out => multiplicand_out);

process (clk,rst,xj,multiplicand_out)
begin
    if (xj = '1') then
        mux_a <= multiplicand_out;
    else
        mux_a <= (others => '0');
    end if;
end process;

half_adder: hadder port map( a => mux_a, b => DWPP_out, sum => hadder_sum, cout => hadder_cout);
DWPP_shift: DWPP port map(clk => clk, rst => rst, cin => hadder_cout, d => hadder_sum, q_hadder => DWPP_out, q_product => final_output); 


product <= final_output;


end Behavioral;

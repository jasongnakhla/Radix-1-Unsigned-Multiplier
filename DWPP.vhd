----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/07/2019 01:10:19 PM
-- Design Name: 
-- Module Name: DWPP - Behavioral
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

entity DWPP is
    Port ( clk : in STD_LOGIC;
           rst: in STD_LOGIC;
           cin: in STD_LOGIC;
           d : in STD_LOGIC_VECTOR(15 downto 0);
           q_hadder : out STD_LOGIC_VECTOR(15 downto 0);
           q_product : out STD_LOGIC_VECTOR(31 downto 0));
end DWPP;

architecture Behavioral of DWPP is

--signal temp_in: STD_LOGIC_VECTOR(16 downto 0):=(others=>'0');
--signal temp_in2: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
--signal temp_out: STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
--signal temp_final: STD_LOGIC_VECTOR(31 downto 0):= temp;
--signal counter: integer:=0;
signal temp: STD_LOGIC_VECTOR(32 downto 0):=(others=>'0');
--signal temp: STD_LOGIC_VECTOR(32 downto 0):= (others => '0');
signal temp_final: STD_LOGIC_VECTOR(32 downto 0):= (others => '0');

begin
process(clk,rst,cin,d)
    begin
    if (rst='1') then
        temp <= (others => '0');
    elsif(rising_edge(clk)) then
        temp <= cin & d & temp(16 downto 1);
    end if;
end process;

q_hadder <= temp(32 downto 17); 
q_product <= temp(32 downto 1); 

end Behavioral;















--begin
--process(clk,rst,cin,d)
--    begin
--    if (rst='1') then
--        temp <= (others => '0');
--    elsif(rising_edge(clk)) then
--        temp <= cin & d & temp(16 downto 1);
--    end if;
--end process;

--q_hadder <= temp(32 downto 17); 
--q_product <= temp(32 downto 1); 

--end Behavioral;



--begin
--process(clk,rst,cin,d)
--    begin
----    temp <= cin & d & temp_half;--temp(15 downto 0);
--    if (rst='1') then
--    temp <= (others => '0');
--    elsif(rising_edge(clk)) then
--        temp <= temp_final;
--        temp_final <= cin & d & temp(16 downto 1); 
----        temp_half_out <= temp_half_in(16 downto 1);
--    end if;

--end process;


--q <= temp_final(32 downto 17);
--q_final <= temp(32 downto 1);
----q_final <= temp(31 downto 0); 

--end Behavioral;






















--begin
--process(clk,rst,cin,d)
--    begin
----    temp <= cin & d & temp_half;--temp(15 downto 0);
--    -- cin is half adder carry out
--    -- d is half adder sum
--    if (rst='1') then
--    temp <= (others => '0');
--    elsif(rising_edge(clk)) then
--        temp <= cin & d & temp(15 downto 0);--temp_half;
----        for i in 0 to 31 loop
----            temp(i) <= temp(i+1);
------            q <= temp(31 downto 16); 
----        end loop;
----        temp <= cin & d & temp(15 downto 0);--temp_half;
----        q <= temp(31 downto 16); 
--    end if;
----    q <= temp(31 downto 16); 
--end process;

--q <= temp(31 downto 16); 
--q_final <= temp(31 downto 0); 

--end Behavioral;





















--begin
--process(clk,rst,cin,d,temp,temp_half)
--    begin
----    temp <= cin & d & temp_half;--temp(15 downto 0);
--    if (rst='1') then
--    temp <= (others => '0');
--    elsif(clk'event and clk='1') then
--        if(load = '1') then
--            temp <= cin & d & temp(15 downto 0);
--        else
----            temp <= cin & d & temp(15 downto 0);
--        for i in 0 to 31 loop
--            temp(i) <= temp(i+1);
----            q <= temp(31 downto 16); 
--        end loop;
--        q <= temp(31 downto 16); 
--            end if;
--    end if;
----    q <= temp(31 downto 16); 
--end process;
--q <= temp(31 downto 16); 
--q_final <= temp(31 downto 0); 
--end Behavioral;








--begin
--process(clk,rst,cin,d,temp,temp_half)
--    begin
----    temp <= cin & d & temp_half;--temp(15 downto 0);
--    -- cin is half adder carry out
--    -- d is half adder sum
--    if (rst='1') then
--    temp <= (others => '0');
--    elsif(clk'event and clk='1') then
----        temp <= cin & d & temp(15 downto 0);--temp_half;
--        for i in 0 to 31 loop
--            temp(i) <= temp(i+1);
----            q <= temp(31 downto 16); 
--        end loop;
----        temp <= cin & d & temp(15 downto 0);--temp_half;
----        q <= temp(31 downto 16); 
--    end if;
----    q <= temp(31 downto 16); 
--end process;
--q <= temp(31 downto 16); 
--q_final <= temp(31 downto 0); 
--end Behavioral;






--begin
--process(clk,rst,cin,d)
--    begin
----        temp_in <= cin & d;
----        temp_final <= temp_in & temp_in2;
--        if (rst = '1') then
--            temp <= (others => '0');
----            temp_in <= (others => '0');
----            temp_out <= (others => '0');
--        elsif (rising_edge(clk)) then
--            temp_final <= temp;
--            temp <= cin & d  & temp_final(16 downto 2);
--        end if;
--        q <= temp_final(31 downto 16);
--end process;
--q_final <= temp_final(31 downto 0);

--end Behavioral;






----              temp(32 downto 17) <= d;
----              temp(16 downto 1) <= temp(32 downto 17);
----              temp <= cin & temp(32 downto 1); 
--            for i in 0 to 31 loop
--                temp_final(i) <= temp_final(i+1);
--                temp_final(32)<= temp_final(0);--cin;
----                counter <= counter + 1;
--            end loop; 
--            temp_out <= temp_final(31 downto 16);
--            q <= temp_out;
--end if;
--end process;
----q <= temp(15 downto 0);
--q_final <= temp_final(31 downto 0);
--end Behavioral;









        
--        if(counter=0) then
--            q <= temp(15 downto 0);
--        elsif(counter=1) then
--            q <= temp(15 downto 0);
--        elsif(counter=2) then
--            q <= temp(15 downto 0);
--        elsif(counter=3) then
--            q <= temp(16 downto 1);
--         elsif(counter=4) then
--            q <= temp(17 downto 2);
--        elsif(counter=5) then
--            q <= temp(19 downto 4);
--        elsif(counter=6) then
--            q <= temp(19 downto 4);
--        elsif(counter=7) then
--            q <= temp(20 downto 5);
--        elsif(counter=8) then
--            q <= temp(21 downto 6);
--        elsif(counter=9) then
--            q <= temp(22 downto 7);
--        elsif(counter=10) then
--            q <= temp(23 downto 8);           
--        elsif(counter=11) then
--            q <= temp(24 downto 9);           
--        elsif(counter=12) then
--            q <= temp(25 downto 10);           
--        elsif(counter=13) then
--            q <= temp(26 downto 11);            
--        elsif(counter=14) then
--            q <= temp(27 downto 12);
--        elsif(counter=15) then
--            q <= temp(28 downto 13);            
--        elsif(counter=16) then
--            q <= temp(29 downto 14);           
--        elsif(counter=17) then
--            q <= temp(30 downto 15);            
--        elsif(counter=18) then
--            q <= temp(31 downto 16);       
--        elsif(counter=19) then
--            q <= temp(32 downto 17);                                   
--        end if;


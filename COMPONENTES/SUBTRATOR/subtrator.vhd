library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity subtrator is
	
	port(
		A    : in unsigned (7 downto 0);
		B    : in unsigned (7 downto 0);
		Sub  : out unsigned (7 downto 0) 
	);
	
end entity;

architecture main of subtrator is
begin

	Sub <= A - B;
	
end main;

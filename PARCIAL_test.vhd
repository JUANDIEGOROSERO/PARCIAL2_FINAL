library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity PARCIAL_test is
	port(
		Car1, Car2, Car3, Car4, Car5, Car6, Car7, Car8	:	in std_logic;
		
		Contrasena													:	in std_logic_vector(3 downto 0);
		
		Front_Sensor, Back_Sensor								:	in std_logic;

		Reset															: 	in std_logic;
		
		Led_Rojo, Led_Verde										:	out 	std_logic;
		
		Display														:	out 	std_logic_vector(6 downto 0)
	);
end PARCIAL_test;

architecture TEST_Arch of PARCIAL_test is
	
	component PARCIAL2
		port(
			Car1, Car2, Car3, Car4, Car5, Car6, Car7, Car8	:	in std_logic;
			Contrasena													:	in std_logic_vector(3 downto 0);
			
			Front_Sensor, Back_Sensor								:	in std_logic;

			Led_Rojo, Led_Verde										:	out 	std_logic;
			
			Bandera1 													:	out	std_logic;
			Bandera2 													: 	out	std_logic;
			Bandera3													 	:	out	std_logic;
			Bandera4								 						:  out	std_logic;			
			Bandera5 													:  out	std_logic;
			Bandera6								 						: 	out	std_logic;
			Bandera7 													: 	out	std_logic;
			Bandera8 													: 	out	std_logic
		);
	end component;

	Signal Bandera1 : std_logic;
	Signal Bandera2 : std_logic;
	Signal Bandera3 : std_logic;
	Signal Bandera4 : std_logic;			
	Signal Bandera5 : std_logic;
	Signal Bandera6 : std_logic;
	Signal Bandera7 : std_logic;
	Signal Bandera8 : std_logic;
	
	component contador_car
		port(
			reset : in STD_LOGIC;
			carros : in STD_LOGIC;
 
			bandera : in STD_LOGIC := '0';
 
			counter : out STD_LOGIC_VECTOR (3 downto 0)
		);
	end component;
	
	Signal Counter_T1 : std_logic_vector(3 downto 0);
	Signal Counter_T2 : std_logic_vector(3 downto 0);
	Signal Counter_T3 : std_logic_vector(3 downto 0);
	Signal Counter_T4 : std_logic_vector(3 downto 0);
	Signal Counter_T5 : std_logic_vector(3 downto 0);
	Signal Counter_T6 : std_logic_vector(3 downto 0);
	Signal Counter_T7 : std_logic_vector(3 downto 0);
	Signal Counter_T8 : std_logic_vector(3 downto 0);
	
	Signal C1			: unsigned(3 downto 0);
	Signal C2			: unsigned(3 downto 0);
	Signal C3			: unsigned(3 downto 0);
	Signal C4			: unsigned(3 downto 0);
	Signal C5			: unsigned(3 downto 0);
	Signal C6			: unsigned(3 downto 0);
	Signal C7			: unsigned(3 downto 0);
	Signal C8			: unsigned(3 downto 0);
	
	Signal CONTADOR 	: unsigned(3 downto 0);
	
begin

A0: PARCIAL2 port map (Car1=>Car1, Car2=>Car2, Car3=>Car3, Car4=>Car4, Car5=>Car5, Car6=>Car6, Car7=>Car7, Car8=>Car8, Contrasena=>Contrasena, 
							  Front_Sensor=>Front_Sensor, Back_Sensor=>Back_Sensor, Led_Rojo=>Led_Rojo, Led_Verde=>Led_Verde, Bandera1=> Bandera1,
							  Bandera2=>Bandera2, Bandera3=>Bandera3, Bandera4=>Bandera4, Bandera5=>Bandera5, Bandera6=>Bandera6, Bandera7=> Bandera7,
							  Bandera8=>Bandera8);
							 
A1: contador_car port map (reset=>Reset, carros=>Front_Sensor, bandera=>Bandera1, counter=>Counter_T1);
A2: contador_car port map (reset=>Reset, carros=>Front_Sensor, bandera=>Bandera2, counter=>Counter_T2);
A3: contador_car port map (reset=>Reset, carros=>Front_Sensor, bandera=>Bandera3, counter=>Counter_T3);
A4: contador_car port map (reset=>Reset, carros=>Front_Sensor, bandera=>Bandera4, counter=>Counter_T4);
A5: contador_car port map (reset=>Reset, carros=>Front_Sensor, bandera=>Bandera5, counter=>Counter_T5);
A6: contador_car port map (reset=>Reset, carros=>Front_Sensor, bandera=>Bandera6, counter=>Counter_T6);
A7: contador_car port map (reset=>Reset, carros=>Front_Sensor, bandera=>Bandera7, counter=>Counter_T7);
A8: contador_car port map (reset=>Reset, carros=>Front_Sensor, bandera=>Bandera8, counter=>Counter_T8);

C1 <= unsigned(Counter_T1);
C2 <= unsigned(Counter_T2);
C3 <= unsigned(Counter_T3);
C4 <= unsigned(Counter_T4);
C5 <= unsigned(Counter_T5);
C6 <= unsigned(Counter_T6);
C7 <= unsigned(Counter_T7);
C8 <= unsigned(Counter_T8);

CONTADOR <= C1 + C2 + C3 + C4 + C5 + C6 + C7 + C8;

DSIS_7_SEG: process (CONTADOR) is
            begin
					case CONTADOR is
						when "0000" => Display <="0000001";
						when "0001" => Display <="1001111";
						when "0010" => Display <="0010010";
						when "0011" => Display <="0000110";
						when "0100" => Display <="1001100";
						when "0101" => Display <="0100100";
						when "0110" => Display <="0100000";
						when "0111" => Display <="0001111";
						when "1000" => Display <="0000000";
						when others => Display <="1111111";
					end case;
				end PROcess;
end TEST_Arch;
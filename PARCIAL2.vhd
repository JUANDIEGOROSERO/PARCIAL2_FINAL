library IEEE;
use IEEE.std_logic_1164.all;

entity PARCIAL2 is
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
end PARCIAL2;

architecture PAR_ARCH of PARCIAL2 is
	Type estado is (E0, E1, E2, E3, E4, E5, E6, E7, E8, E9);
	Signal Estado_presente1, Estado_futuro1	:	estado;
	Signal Estado_presente2, Estado_futuro2	:	estado;
	
	Signal Back_Sensor_Flag : std_logic;
	
	Signal CAR		 : std_logic_vector(7 downto 0);
	
begin

CAR <= Car1 & Car2 & Car3 & Car4 & Car5 & Car6 & Car7 & Car8;

----------------------------MAQUINA 1 CONTROL DE SENSORES----------------------------

Maquina1_Logica_estadofuturo:	process(Estado_presente1, Front_Sensor, Back_Sensor, Back_Sensor_Flag)
										begin
											
											case Estado_presente1 is

											when E0 => if Front_Sensor = '1' and Back_Sensor = '0' then
															  Estado_futuro1 <= E1;
														  end if;
														  
											when E1 => if Front_Sensor = '0' and Back_Sensor_Flag = '1' then
															  Estado_futuro1 <= E0;
														  end if;
											when others => Estado_futuro1 <= E1;
											end case;
											
										end process;
										
Maquina1_Logica_salida:			process(Estado_presente1, Front_Sensor, Back_Sensor, Back_Sensor_Flag)
										begin
										
											case Estado_presente1 is
												when E0	=>	if Front_Sensor = '0' and Back_Sensor = '0' then
																	Led_Rojo  <= '1';
																	Led_Verde <= '0';
																end if;
																
												when E1	=> if Front_Sensor = '1' and Back_Sensor ='0' then
																	Led_Rojo  <= '1';
																	Led_Verde <= '0';
																end if;
																
												when others => Led_Rojo  <='0';
																	Led_Verde <='1';
											end case;
										
										end process;
											
----------------------------MAQUINA 2 CONTROL DE PUESTOS Y CONTRASEÑA----------------------------

Maquina2_Logica_estadofuturo:process(Estado_presente2, Contrasena, Car1, Car2, Car3, Car4, Car5, Car6, Car7, Car8)
									  begin
									
										case	Estado_presente2 is
										
											when E1	=>	if Contrasena = "0001" and Car1='1' then
																Estado_futuro2 <= E2;
															end if;
											when others => Estado_futuro2 <= E1;
											
										end case;
										
										
										case	Estado_presente2 is
											when E1	=>	if Contrasena = "0010" and Car2='1' then
																Estado_futuro2 <= E3;
															end if;
											when others => Estado_futuro2 <= E1;
											
										end case;
										
										
										case	Estado_presente2 is
											when E1	=>	if Contrasena = "0011" and Car3='1' then
																Estado_futuro2 <= E4;
															end if;
											when others => Estado_futuro2 <= E1;
										
										end case;	
										
										
										case	Estado_presente2 is	
											when E1	=>	if Contrasena = "0100" and Car4='1' then
																Estado_futuro2 <= E5;
															end if;
											when others => Estado_futuro2 <= E1;
										
										end case;	
										
										
										case	Estado_presente2 is
											when E1	=>	if Contrasena = "0101" and Car5='1' then
																Estado_futuro2 <= E6;
															end if;
											when others => Estado_futuro2 <= E1;
										
										end case;	
										
										
										case	Estado_presente2 is	
											when E1	=>	if Contrasena = "0110" and Car6='1' then
																Estado_futuro2 <= E7;
															end if;
											when others => Estado_futuro2 <= E1;
										
										end case;	
										
										
										case	Estado_presente2 is				
											when E1	=>	if Contrasena = "0111" and Car7='1' then
																Estado_futuro2 <= E8;
															end if;
											when others => Estado_futuro2 <= E1;
										
										end case;	
										
										
										case	Estado_presente2 is			
											when E1	=>	if Contrasena = "1000" and Car8='1' then
																Estado_futuro2 <= E9;
															end if;
											when others => Estado_futuro2 <= E1;
										
										end case;	
										
										
										case	Estado_presente2 is
											when E1	=>	if Contrasena = "0000" or Contrasena ="1001" or Contrasena ="1010" or Contrasena ="1011" or Contrasena ="1100" or Contrasena ="1101" or Contrasena ="1110" or Contrasena ="1111" then
																Estado_futuro2 <= E1;
															end if;
											when others => Estado_futuro2 <= E0;
										end case;
										
										
										case	Estado_presente2 is
											when E1	=>	if Car1='0' and Car2 ='0' and Car3='0' and Car4='0' and Car5='0' and Car6='0' and Car7='0' and Car8='0' then
																Estado_futuro2 <= E0;
															end if;
											when others => Estado_futuro2 <= E1;
									   
										end case;
										
									  end process;

										
Maquina2_Logica_salida:			process(Estado_presente2, Contrasena, Car1, Car2, Car3, Car4, Car5, Car6, Car7, Car8, CAR)
										 begin
										
											case Estado_presente2 is
											
												when E1	=> if CAR ="00000000" then
																	Bandera1 <= '0';
																	Bandera2 <= '0';
																	Bandera3 <= '0';
																	Bandera4 <= '0';
																	Bandera5 <= '0';
																	Bandera6 <= '0';
																	Bandera7 <= '0';
																	Bandera8 <= '0';
																end if;
												when E2	=>	if Contrasena = "0001" and Car1='1' then
																	Back_Sensor_Flag <= '1';
																	Bandera1 <= '1';
																elsif Car1='1' then
																	Bandera1 <= '0';
																end if;
												when E3	=>	if Contrasena = "0010" and Car2='1' then
																	Back_Sensor_Flag <= '1';
																	Bandera2 <= '1';
																elsif Car2='1' then
																	Bandera2 <= '0';
																end if;
												when E4	=>	if Contrasena = "0011" and Car3='1' then
																	Back_Sensor_Flag <= '1';
																	Bandera3 <= '1';
																elsif Car3='1' then
																	Bandera3 <= '0';
																end if;
												when E5	=>	if Contrasena = "0100" and Car4='1' then
																	Back_Sensor_Flag <= '1';
																	Bandera4 <= '1';
																elsif Car4='1' then
																	Bandera4 <= '0';
																end if;
												when E6	=>	if Contrasena = "0101" and Car5='1' then
																	Back_Sensor_Flag <= '1';
																	Bandera5 <= '1';
																elsif Car5='1' then
																	Bandera5 <= '0';
																end if;
												when E7	=>	if Contrasena = "0110" and Car6='1' then
																	Back_Sensor_Flag <= '1';
																	Bandera6 <= '1';
																elsif Car6='1' then
																	Bandera6 <= '0';
																end if;
												when E8	=>	if Contrasena = "0111" and Car7='1' then
																	Back_Sensor_Flag <= '1';
																	Bandera7 <= '1';
																elsif Car7='1' then
																	Bandera7 <= '0';
																end if;
												when E9	=>	if Contrasena = "1000" and Car8='1' then
																	Back_Sensor_Flag <= '1';
																	Bandera8 <= '1';
																elsif Car8='1' then
																	Bandera8 <= '0';
																end if;
												when others => Back_Sensor_Flag <= '0';
											end case;
											
										end process;

end PAR_ARCH;

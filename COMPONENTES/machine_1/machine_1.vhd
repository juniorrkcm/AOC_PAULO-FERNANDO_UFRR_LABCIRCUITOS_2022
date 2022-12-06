LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY machine_1 IS
PORT(
	A : IN std_logic;
	CLK : IN std_logic;
	RST : IN std_logic;
	Z : OUT std_logic
);
END machine_1;

ARCHITECTURE logic OF machine_1 IS
	TYPE type_state IS (E1, E2, E3, E4);
	SIGNAL atual_state : type_state;
	SIGNAL reg_state : type_state;
BEGIN
	PROCESS (CLK, reg_state) --Qualquer atualização
	BEGIN  --atualizando estados
		IF (CLK'event AND CLK='1') THEN
			atual_state <= reg_state;
		END IF;
	END PROCESS;
	
	PROCESS (A, RST, atual_state)
	BEGIN
		IF (RST='1') THEN --Estado E1
			reg_state <= E1;
			Z <= '0';
		ELSE
			CASE atual_state IS
				WHEN E1 => 
					IF (A = '1') THEN
						reg_state <= E2;
					ELSIF (A = '0') THEN
						reg_state <= E1;
					END IF;
					Z <= '0';
				WHEN E2 => 
					IF (A = '1') THEN
						reg_state <= E3;
					ELSIF (A = '0') THEN
						reg_state <= E2;
					END IF;
					z <= '0';
				WHEN E3 =>
					IF (A = '1') THEN
						reg_state <= E4;
					ELSIF (A = '0') THEN
						reg_state <= E3;
					END IF;
					z <= '0';
				WHEN E4 =>
					IF (A = '1') THEN
						reg_state <= E4;
					ELSIF (A = '0') THEN
						reg_state <= E1;
					END IF;
					z <= '1';
					
				WHEN OTHERS =>
					z <= 'X';
			END CASE;
		END IF;
	END PROCESS;
END logic;
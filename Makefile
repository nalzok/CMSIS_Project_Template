main.bin: src/main.c
	arm-none-eabi-gcc \
		-IDrivers/CMSIS/Core/Include \
		-IDrivers/CMSIS/Device/ST/STM32F1xx/Include \
		-DSTM32F103xB \
		-mthumb \
		-mcpu=cortex-m3 \
		-specs=nosys.specs \
		-TSTM32F103XB_FLASH.ld \
		-o build/main.elf \
		startup/system_stm32f1xx.c \
		startup/startup_stm32f103xb.s \
		src/main.c
	arm-none-eabi-objcopy -O binary build/main.elf build/main.bin


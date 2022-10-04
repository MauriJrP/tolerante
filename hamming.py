import random

valid_hamming_codes = ['0000000',
'1110000',
'1001100',
'0111100',
'0101010',
'1011010',
'1100110',
'0010110',
'1101001',
'0011001',
'0100101',
'1010101',
'1000011',
'0110011',
'0001111',
'1111111']

H = [
[1, 0, 1, 0, 1, 0, 1],
[0, 1, 1, 0, 0, 1, 1],
[0, 0, 0, 1, 1, 1, 1]
]

error_bit = {
'001' : 1,
'010' : 2,
'011' : 3,
'100' : 4,
'101' : 5,
'110' : 6,
'111' : 7
}

def parity_check(data):
    r = [int(b) for b in data]
    z = []
    for row in range(3):
        acum = 0
        for i in range(7):
            acum += H[row][i] * r[i]
        z.append(acum%2)
    result = str(z[0])+str(z[1])+str(z[2])
    return not bool(z[0] + z[1] + z[2]), result

def error_correction(data, parity_check):
    erroneos_bit = error_bit[parity_check]-1
    corrected = data[0:erroneos_bit] + ('1' if data[erroneos_bit] == '0' else '0') + data[erroneos_bit+1:]
    return corrected, erroneos_bit

def main():
    opc = -1
    while opc != 0:
        print('''
1) Generar cadena valida
2) Generar cadena con errores
3) Verificar cadena
0) Salir 
''')
        opc = int(input('Selecciona una opcion:'))
        if opc == 1:
            bloques = random.randint(1, 71)
            cadena = ''
            for i in range(bloques):
                cadena += valid_hamming_codes[random.randint(0, len(valid_hamming_codes)-1)]
            print(f'Cantidad de bloques: {bloques}\nTrama: {cadena}')
        elif opc == 2:
            errores = -1
            while errores < 1 or errores > 5:
                 errores = int(input('Cantidad de errores? (entre 1 y 5): '))
            bloques = random.randint(errores, 71)
            cadena = ''
            for i in range(bloques):
                cadena += valid_hamming_codes[random.randint(0, len(valid_hamming_codes)-1)]
            bloques_erroneos = []
            for i in range(errores):
                bloque = random.randint(0, bloques-1)
                while bloque in bloques_erroneos:
                    bloque = random.randint(0, bloques)
                bit_erroneo = 7*bloque+random.randint(0,6)
                cadena = cadena[:bit_erroneo] + ('1' if cadena[bit_erroneo] == '0' else '0') + cadena[bit_erroneo+1:]
                bloques_erroneos.append(bloque)
            print(f'Bloques: {bloques}\nCadena: {cadena}')
        elif opc == 3:
            cadena = input('Ingresa la trama: ')
            indice = 0
            contador_bloque = 0
            mensaje = ''
            while indice < len(cadena):
                bloque = cadena[indice:indice+7]
                correcto, resultado = parity_check(bloque)
                if not correcto:
                     print(f'Bloque #{contador_bloque} {bloque}', end=' ')
                     bloque, bit_incorrecto = error_correction(bloque, resultado)
                     print(f'con error en bit #{bit_incorrecto} Bloque corregido: {bloque}')
                mensaje += bloque
                indice += 7
                contador_bloque += 1
            print(f'Trama recibida : {cadena}')
            print(f'Trama corregida: {mensaje}')

if __name__ == '__main__':
    main()


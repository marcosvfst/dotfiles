import time
import subprocess

def spammador(recebe):
        comando  = ["asterisk", "-rx", recebe]
        resultado = subprocess.run(comando, capture_output=True, text=True)
        print(resultado.stdout)

def ligador(nmr):
        comando  = ["asterisk", "-rx", "channel", "originate", f"SIP/{nmr}", "application", "playback", "medo"]
        resultado = subprocess.run(comando, capture_output=True, text=True)
        print(resultado.stdout)

comeco = input("O que você quer spammar? ")
if comeco == "oi":
    print("TRAVA ZOIPER")
    entrada = input("Digite os ramais separados por vírgula: ")
    ramal_lista = [ramal.strip() for ramal in entrada.split(',')]
    ramal_tupla = tuple(ramal_lista)
    print(f"Tupla criada: {ramal_tupla}")
    while True:
        for ramal in ramal_tupla:  
            ligador(ramal)
            time.sleep(0.1)
else:
    while True:
        spammador(comeco)




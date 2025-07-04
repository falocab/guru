#!/usr/bin/env python3
import subprocess
import argparse
from gpt4all import GPT4All
import os
from rich import print
from rich.progress import Progress

MODEL_PATH = os.path.expanduser("~/.local/share/gpt4all/mistral-7b-instruct-v0.1.Q4_0.gguf")

print("[bold blue]Analizando entorno con GPT4All...[/bold blue]")

try:
    with Progress() as progress:
        task = progress.add_task("[cyan]Cargando modelo...[/cyan]", total=100)
        for _ in range(5):
            progress.advance(task, 20)
            import time; time.sleep(0.3)
    model = GPT4All(model_name=MODEL_PATH, model_type="mistral")
except Exception as e:
    print(f"[❌] Error cargando el modelo: {e}")
    exit(1)

def ejecutar_comando(comando):
    try:
        resultado = subprocess.run(comando, shell=True, check=False,
                                   stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, timeout=2400)
        return resultado.stdout + resultado.stderr
    except subprocess.TimeoutExpired:
        return "⏱️ El comando tardó demasiado en ejecutarse y fue cancelado."
    except Exception as e:
        return f"❌ Error ejecutando el comando: {e}"

def construir_pregunta(salida, agregado):
    base = f"Explica en español qué hace el siguiente resultado de terminal:\n\n{salida.strip()}"
    if agregado:
        base += f"\n\nAdemás, {agregado.strip()}"
    return base

def preguntar_localmente(pregunta):
    with model.chat_session():
        respuesta = model.generate(pregunta, max_tokens=512)
    return respuesta.strip()

def main():
    parser = argparse.ArgumentParser(description="Ejecuta un comando y recibe explicación local.")
    parser.add_argument("-c", "--comando", required=True, help="Comando a ejecutar, entre comillas.")
    parser.add_argument("-a", "--agregar", help="Texto adicional para dar contexto.", default=None)

    args = parser.parse_args()

    salida = ejecutar_comando(args.comando)
    pregunta = construir_pregunta(salida, args.agregar)
    explicacion = preguntar_localmente(pregunta)

    print(f"\n[bold cyan]-----------Salida del comando-----------[/bold cyan]\n{salida}")
    print("\n[bold green]-----------------GURU-------------------[/bold green]")
    print(f"{explicacion}")

if __name__ == "__main__":
    main()

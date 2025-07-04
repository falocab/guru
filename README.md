
# **GURU** vBeta

**GURU** es una herramienta que utiliza GPT-ALL de forma local para analizar comandos y errores de terminal.  
Este proyecto fue concebido en un principio para poder integrarse en contenedores ligeros junto con herramientas a probar, con el objetivo de analizar de forma controlada posibles errores durante su instalación o ejecución. Gracias a su capacidad para lanzar comandos arbitrarios y analizar sus salidas mediante un modelo local, resulta útil como interfaz auxiliar en entornos de testing o troubleshooting.


**Dependencias**
---
GURU ha sido probado en distribuciones Linux como Debian, Ubuntu y KaliLinux. 

Necesita lo siguiente:

### Sistema
- Python 3.8 o superior
- pip
- git
- curl
### Python (se instalan automáticamente):
- `rich`
- `gpt4all`
- `pyfiglet` (opcional, para cabeceras decorativas)
- `colorama` (para compatibilidad de colores entre shells)
---
### Pasos de instalación
1. **Clonar el repositorio**

- sudo git clone https://github.com/falocab/guru.git
- cd guru
- sudo chmod +x setup.sh
- sudo ./setup.sh
  
![imagen](https://github.com/user-attachments/assets/22f94c90-c4c8-4758-b61b-7583c58edfbd)

*Instalación en Ubuntu 24.10*


![imagen](https://github.com/user-attachments/assets/edc0939e-e4bc-4519-aa8d-1a7aea8359f8)

*Instalación en KaliLinux 2024.2*

Este script:
   -  Instala automáticamente las dependencias con pip
   -  Crea un alias guru para que puedas llamarlo desde cualquier parte del sistema
   -  Copia el script al path del usuario o lo deja en una ruta accesible según configuración
---
### USO
Una vez instalado, puedes usar guru directamente desde la terminal.

Sintaxis:

*sudo guru -c "comando a ejecutar" -a "añadir algo a la consulta IA"*

Ejemplos:

`sudo guru -c 'pip install nmap' -a '¿se ha instalado la herramienta?`
![imagen](https://github.com/user-attachments/assets/fb258370-13f0-45f8-9585-3eca6c0762ba)

*Ejecución en Ubuntu 24.10*

`sudo guru -c "nmap -sV 192.168.80.1" -a "¿que servicios estan corriendo en este host?" `
![imagen](https://github.com/user-attachments/assets/547c6d08-ca62-4906-886b-2bd730eb69e6)

*Ejecución en KaliLinux 2024.2*

Esto hará:
-    Ejecutar el comando indicado
-    Mostrar su salida real
-    Lanzar la IA (en local) para explicarte qué hace el comando
-    Mostrar esa explicación de forma clara

¿Qué aporta?
-    Te ayuda a entender comandos que estás ejecutando
-    Facilita el aprendizaje y la formación
-    Todo en local, sin necesidad de conexión externa

A tener en cuenta: 
- `Esta herramienta está en fase beta. Puedes revisarla, modificarla o colaborar. Revisa siempre el código antes de ejecutar comandos que afecten a tu sistema.`
- `Tarda bastante en ejecutarse, así que ten paciencia… y aprovecha para reflexionar sobre lo efímeros que somos: una mota de polvo flotando sin rumbo en el vacío cósmico… ¡y tú preocupándote por un script!`


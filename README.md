
# **GURU** vBeta

**GURU** es una herramienta que utiliza GPT-ALL de forma local para analizar comandos y errores de terminal.  
Este proyecto fue concebido en un principio para poder integrarse en contenedores ligeros junto con herramientas a probar, con el objetivo de analizar de forma controlada posibles errores durante su instalación o ejecución. Gracias a su capacidad para lanzar comandos arbitrarios y analizar sus salidas mediante un modelo de inteligencia artificial local, resulta útil como interfaz auxiliar en entornos de testing o troubleshooting.


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


![image](https://github.com/user-attachments/assets/8fab3e31-5764-428f-bffd-2d5ca979be85)

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

Ejemplo:

`sudo guru -c "nmap -sV 192.168.80.1" -a "¿que servicios estan corriendo en este host?" `

![image](https://github.com/user-attachments/assets/16d618d7-7f1e-4f5e-96fa-07a8ddc3a9ae)

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


# Script de Python para la lectura de datos en archivos TXT sobre la convergencia numérica
# Correr directamente desde el MakeFile para completar las instancias requeridas. (ValenciaCamilo_HPC_S4C1Casa.mk).
# Desarrollado por Camilo Andres Valencia Acevedo para el curso de Intro. al HPC 2023-1
# Semana 4, Clase 1

# Librerías necesarias
import numpy as np
import matplotlib.pyplot as plt
import os

#Verificar el directorio de trabajo del script actual
#print("Directorio de trabajo del script: " + os.getcwd())

# Corrección del directorio de trabajo actual, dado que el script 
# cree que el workpath es el del archivo original y no encuentra los archivos .txt
# al cambiar de ubicación mediante copiado. 
# NOTA: Parece que esto solo sucede desde VScode, mantener comentada la línea 19 para correr
# desde Terminal
#os.chdir(os.path.dirname(__file__))

# Carga los datos de los txt ignorando la primera fila
# pues solo es el título de cada columna, se usó para entender los datos nada más
dataForward = np.loadtxt("datosForward.dat", skiprows=1)
dataCentral = np.loadtxt("datosCentral.dat", skiprows=1)
dataH = np.loadtxt("datosH.dat", skiprows=1)

# Separa los datos en arreglos
forwardY = dataForward[:,0]
analyticY = dataForward[:,1]
errorForwardY = dataForward[:,2]
forwardT = dataForward[:,3]

centralY = dataCentral[:,0]
analyticY = dataCentral[:,1]
errorCentralY = dataCentral[:,2]
centralT = dataCentral[:,3]

variacionY = dataH[:,0]
variacionH = dataH[:,1]


# Plot de Forward
plt.xlabel("X")
plt.ylabel("Error %")
plt.plot(forwardT,errorForwardY, 'bo', markersize=2)
plt.grid(True)
#Guardado de la figura en un PDF          
plt.savefig("err_derF.pdf", format="pdf", dpi=250)
plt.close()

# Plot de los Central
plt.plot(centralT,errorCentralY, 'go', markersize=2)
plt.xlabel("X")
plt.ylabel("Error %")
plt.grid(True)
#Guardado de la figura en un PDF          
plt.savefig("err_derC.pdf", format="pdf", dpi=250)
plt.close()

# Plot de Convergencia
plt.plot(variacionH, variacionY, 'bo', markersize=2)
plt.xlabel("h o tamaño de paso")
plt.ylabel("Aproximación de Cos($\pi/3$)")
plt.xscale('log')
plt.xticks([1,0.1,0.01,0.0007],[1,0.1,0.01,0.0007])
plt.axhline(y=0.5, color='r', linestyle='--')
plt.gca().invert_xaxis()
plt.grid(True)
plt.legend({"Cos($\pi/3$) Real","Cos($\pi/3$) según el valor de $h$"})
#Guardado de la figura en un PDF          
plt.savefig("err_der_h.pdf", format="pdf", dpi=250)
plt.close()
import glob
import os

key = "<Digite a palavra aqui>"

os.chdir('C:\Users\giba_\OneDrive\Documents\GitHub\LotoNadaFacil\BancoDados')
for filename in glob.glob('*.asp'):
    print("Verificando o arquivo",filename,"...")
    file = open(filename)
    if key in file.read():
        print("A palavra",key,"existe no arquivo",filename+"!")
    file.close()
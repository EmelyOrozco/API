using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Diagnostics;

namespace Operaciones_basicas
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // Ruta del archivo
            string filePath = @"C:\\Users\\Orozco\\Desktop\\mi_archivo.txt";

            // Contenido que se va a escribir
            string contenido = "Hola Mundo";

            // Escribir en el archivo
            File.WriteAllText(filePath, contenido);

            Console.WriteLine("Operación de escritura completada.");

            if (File.Exists(filePath))
            {
                // Abrir el archivo con la aplicación predeterminada del sistema
                Process.Start(filePath);
            }
            else
            {
                Console.WriteLine("El archivo no existe.");
            }
        }
    }
}

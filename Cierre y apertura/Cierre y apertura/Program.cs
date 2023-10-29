using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cierre_y_apertura
{
    internal class Program
    {
        static void Main(string[] args)
        {
            // Ruta del archivo
            string filePath = @"C:\\Users\\Orozco\\Desktop\\mi_archivo.txt";

            // Leer el contenido del archivo
            string contenido = File.ReadAllText(filePath);

            Console.WriteLine("Contenido del archivo:");
            Console.WriteLine(contenido);
        }
    }
}

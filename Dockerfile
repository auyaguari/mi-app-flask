# Imagen base
FROM python:3.9-slim

# Variables de entorno
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Directorio de trabajo
WORKDIR /app

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y build-essential

# Instalar dependencias de Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar la aplicación
COPY . .

# Exponer puerto
EXPOSE 8000

# Comando para ejecutar con Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]

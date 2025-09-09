# Sistema de Gestión de Inventario 📦

Un sistema completo de gestión de inventario desarrollado con base de datos relacional MySQL, que permite administrar productos, proveedores y transacciones de compra/venta.

## 🚀 Características

- **Gestión de Productos**: Registro y control de inventario
- **Administración de Proveedores**: Base de datos de suppliers
- **Transacciones**: Control de compras y ventas
- **Integridad Referencial**: Relaciones entre tablas garantizadas
- **Consultas Avanzadas**: Reportes y análisis de datos
- **Transacciones ACID**: Operaciones seguras y consistentes

## 📊 Modelo de Base de Datos

### Entidades Principales

```
PROVEEDORES (1) ──── (N) PRODUCTOS (1) ──── (N) TRANSACCIONES
```

- **Proveedores**: Información de contacto y datos del supplier
- **Productos**: Catálogo con precios e inventario
- **Transacciones**: Registro de movimientos (compras/ventas)

### Normalización
- Cumple con la **3ra Forma Normal (3NF)**
- Elimina redundancias y dependencias transitivas
- Garantiza integridad de datos

## 🛠️ Instalación y Configuración

### Prerrequisitos
- MySQL 9.4
- Cliente MySQL

### Instalación

1. **Clonar el repositorio**
```bash
git clone https://github.com/moisesdatasci/sistema-inventario.git
cd sistema-inventario
```

2. **Ejecutar scripts en orden**
```bash
# 1. Crear tablas
mysql -u root -p < tablas.sql

# 2. Insertar datos de ejemplo
mysql -u root -p < datos.sql

# 3. Manipulación de datos
mysql -u root -p < datos.sql

# 4. Probar consultas 
mysql -u root -p < queries_basicas.sql
mysql -u root -p < queries_complejas.sql

# 5. Realizar transacciones
mysql -u root -p < transacciones.sql
```

## 📁 Estructura del Proyecto

```
sistema-inventario/
├── README.md                # Documentación principal
├── tablas.sql               # Script de creación de BD y tablas
├── datos.sql                # Datos de ejemplo
├── queries_basicas.sql      # Consultas de prueba y reportes
├── manipulacion_datos.sql   # Manipulando la base de datos
├── queries_complejas.sql    # Consultas de prueba y reportes
├── transacciones.sql        # Ejemplos de transacciones
└── docs/
    └── modelo_er.md         # Documentación del modelo ER
```

## 💾 Scripts Disponibles

### tablas.sql
Crea la base de datos `inventario_db` y todas las tablas necesarias con sus restricciones.

### datos.sql
Inserta datos de ejemplo para:
- 4 proveedores
- 8 productos
- 23 transacciones de prueba

### queries_basicos.sql & queries_complejos.sql
Colección de consultas útiles:
- Consultas básicas de inventario
- Reportes de ventas
- Análisis de proveedores
- Productos con bajo stock

### transacciones.sql
Ejemplos de transacciones SQL:
- Registro seguro de compras/ventas
- Manejo de errores con ROLLBACK
- Procedimientos almacenados
- Transferencias entre productos

## 📈 Consultas Principales

### Inventario Actual
```sql
SELECT nombre, cantidad_inventario, precio,
       (precio * cantidad_inventario) as valor_inventario
FROM productos 
WHERE cantidad_inventario > 0;
```

### Productos con Bajo Stock
```sql
SELECT nombre, cantidad_inventario, precio
FROM productos 
WHERE cantidad_inventario < 10;
```

### Resumen de Ventas
```sql
SELECT COUNT(*) as total_ventas,
       SUM(t.cantidad) as productos_vendidos,
       SUM(t.cantidad * p.precio) as valor_total
FROM transacciones t
JOIN productos p ON t.id_producto = p.id_producto
WHERE t.tipo = 'venta';
```

## 🔧 Funcionalidades Avanzadas

### Transacciones ACID
- Operaciones atómicas para compras/ventas
- Manejo automático de inventario
- Rollback en caso de errores

### Integridad Referencial
- Claves foráneas entre tablas
- Restricciones de dominio
- Validaciones de negocio

### Procedimientos Almacenados
- `VentaSegura()`: Venta con validación de inventario
- Control automático de stock
- Manejo de errores

## 📊 Casos de Uso

1. **Registro de Compras**
   - Actualización automática de inventario
   - Registro de transacción
   - Validación de proveedor

2. **Procesamiento de Ventas**
   - Verificación de stock disponible
   - Reducción de inventario
   - Generación de reportes

3. **Análisis de Inventario**
   - Productos con bajo stock
   - Valor total del inventario
   - Análisis de rotación

4. **Gestión de Proveedores**
   - Evaluación de suppliers
   - Análisis de compras por proveedor
   - Reasignación de productos

## 🧪 Datos de Ejemplo

El sistema incluye datos de prueba con:
- Productos tecnológicos (laptops, periféricos, etc.)
- Proveedores colombianos
- Transacciones del 2024
- Precios en pesos colombianos (COP)

## 🔒 Restricciones Implementadas

- Precios mayores a cero
- Inventario no negativo
- Cantidades de transacción positivas
- Tipos de transacción limitados (compra/venta)
- Integridad referencial estricta

## 📚 Documentación Técnica

### Modelo Entidad-Relación
- **1:N** entre Proveedores y Productos
- **1:N** entre Productos y Transacciones
- **1:N** entre Proveedores y Transacciones (compras)

### Normalización Aplicada
- **1NF**: Atributos atómicos
- **2NF**: Sin dependencias parciales
- **3NF**: Sin dependencias transitivas

## 👥 Autor

- **Moisés Joel Ortega Catriñir** - [GitHub](https://github.com/moisesdatasci)

## 🙏 Agradecimientos

- Proyecto desarrollado como parte de actividad académica de Talento Digital
- Implementación de conceptos de bases de datos relacionales
- Aplicación de principios ACID y normalización

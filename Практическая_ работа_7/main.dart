// Импорт пакета Flutter Material Design, который содержит виджеты и стили
import 'package:flutter/material.dart';

// Точка входа в приложение
void main() {
  // Запуск приложения с указанием корневого виджета
  runApp(
    // MaterialApp обеспечивает тематику, навигацию и базовую структуру приложения
    MaterialApp(
      // home — основной экран приложения
      home: Scaffold(
        // AppBar — верхняя панель приложения
        appBar: AppBar(
          // Текст заголовка в AppBar
          title: Text('Карточка товара'),
          // Цвет фона AppBar
          backgroundColor: Colors.blue,
        ),
        // body — основное содержимое экрана под AppBar
        body: Center(
          // Центрирует дочерний виджет по горизонтали и вертикали
          child: Padding(
            // Внешние отступы вокруг дочернего виджета (16 логических пикселей со всех сторон)
            padding: EdgeInsets.all(16.0),
            // Вызов функции, которая возвращает виджет карточки товара
            child: _buildProductCard(),
          ),
        ),
      ),
    ),
  );
}

// Функция, возвращающая виджет карточки товара (отдельно для читаемости)
Widget _buildProductCard() {
  return Container(
    // Внешняя рамка (декорация)
    decoration: BoxDecoration(
      // Простая сплошная рамка серого цвета толщиной 10 пикселей
      border: Border.all(color: Colors.grey, width: 10.0),
      // Закругление углов рамки радиусом 12 пикселей
      borderRadius: BorderRadius.circular(12.0),
    ),
    // Внутренние отступы внутри контейнера (от границ до дочернего виджета)
    padding: EdgeInsets.all(16.0),
    // Дочерний виджет — вертикальная колонка
    child: Column(
      // Занимает минимальную высоту по вертикали (не растягивается на весь экран)
      mainAxisSize: MainAxisSize.min,
      // Выравнивание дочерних виджетов по левому краю по горизонтали
      crossAxisAlignment: CrossAxisAlignment.start,
      // Список дочерних виджетов колонки
      children: [
        // === 1. Заголовок товара ===
        Text(
          'Дубликатор на Life Fido', // Текст заголовка
          style: TextStyle(
            fontSize: 20,               // Размер шрифта
            fontWeight: FontWeight.bold, // Жирное начертание
            color: Colors.black,        // Цвет текста
          ),
          textAlign: TextAlign.left,    // Выравнивание текста по левому краю
        ),
        // Пустое пространство высотой 12 пикселей (отступ)
        SizedBox(height: 12),

        // === 2. Картинка товара ===
        Center(
          // Центрирует изображение по горизонтали
          child: Image.network(
            // URL изображения из интернета
            'https://vashpult.ru/wa-data/public/shop/products/03/33/23303/images/19317/19317.0x200.jpg',
            width: 300,   // Ширина картинки
            height: 250,  // Высота картинки
            fit: BoxFit.cover, // Режим заполнения: масштабирует с сохранением пропорций, обрезая лишнее
          ),
        ),

        // Пустое пространство высотой 16 пикселей
        SizedBox(height: 16),

        // === 3. Описание товара в отдельном контейнере с отступами ===
        Container(
          // Внутренние отступы внутри этого контейнера
          padding: EdgeInsets.all(12.0),
          // Декорация фона
          decoration: BoxDecoration(
            color: Colors.grey[100],   // Светло-серый фон
            borderRadius: BorderRadius.circular(8.0), // Закругление углов
          ),
          // Дочерний виджет — текст описания
          child: Text(
            'дубликатор 2 в 1 для Life Fido комплектуется подробной инструкцией по настройке. Также инструкцию вы можете скачать на этой странице в самом конце описания к товару.',
            style: TextStyle(
              fontSize: 14,    // Размер шрифта
              height: 1.4,     // Межстрочный интервал (1.4 от размера шрифта)
            ),
            softWrap: true,    // Перенос длинных строк
          ),
        ),

        // Пустое пространство высотой 16 пикселей
        SizedBox(height: 16),

        // === 4. Цена и рейтинг в одной строке (Row) ===
        Row(
          // Распределение пространства между дочерними элементами
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Блок цены
            Text(
              '₽900',                     // Текст цены
              style: TextStyle(
                fontSize: 24,                // Крупный шрифт
                fontWeight: FontWeight.bold, // Жирный
                color: Colors.green,         // Зелёный цвет
              ),
            ),
            // Блок рейтинга (вложенный Row для звёздочки и текста)
            Row(
              children: [
                Icon(Icons.star,            // Иконка звезды
                  color: Colors.amber,      // Янтарный цвет
                  size: 20,                 // Размер иконки
                ),
                SizedBox(width: 4),          // Отступ 4 пикселя между иконкой и текстом
                Text(
                  '4.8 (124 отзыва)',       // Текст рейтинга
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600], // Серый цвет
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
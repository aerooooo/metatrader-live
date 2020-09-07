# Metatrader.live
MQL5 client for http://metatrader.live

Торговый терминал `Metatrader` является одним из наиболее распространенных инструментов доступа к рынку `Forex`. Встроенный язык программирования `MQL5` позволяет реализовывать сложные стратегии автоматизированной торговли, и является одной из причин высокой популярности терминала. Однако, сегодня все больше и больше трейдеров нуждаются не только в торговых инструментах, но также в средствах публикации и доставки результатов своей работы в `WEB`. К сожалению, терминал `Metatrader` предоставляет только базовые возможности взаимодействия с `online`-сервисами и системами.

Данный проект предоставляет собой **сервис передачи торговых данных в сеть Интернет**. Обновление данных выполняется каждую минуту или каждую секунду - по Вашему выбору. Передаваемые терминалом данные сразу доступны `online` - регистрация не требуется. Данные предоставляются несколькими способами:
1. WEB-страница `metatrader.live/accounts/{Page name}`
2. REST API `metatrader.live/api/rest/{Page name}`
3. WebSockets API `metatrader.live/api/ws/{Page name}`

## Безопасность
Проект изначально разрабатывался чтобы быть максимально безопасным. Вы сами решаете, какие данные об аккаунте будут передаваться - либо не передаваться совсем. Публикация только торговых данных без данных об аккаунте делает вашу публикацию обезличенной.

Кроме того, данный проект предоставляется с открытым исходным кодом и не содержит скрытых угроз и возможностей.

## Передача данных / нагрузка на сеть
Вторая цель проекта - скорость. Нет, СКОРОСТЬ! Для передачи данных используется экстремально эффективный бинарный протокол, снижающий нагрузку на сетевое подключение в десятки раз по сравнению с другими методами передачи (XML, JSON). Объем передаваемой информации при секундном обновлении, максимальной нагрузке и волатильности рынка не превышает 500-700 KB/час. Несколько открытых позиций на спокойном рынке генерируют объем передачи <100KB в час.

Сравните это с открытием заглавной страницы `mail.ru` (2.4MB).

## Системные требования
Торговый терминал `Metatrader 5 (MQL5)`. Версия для `Metatrader 4` находится в разработке.

## Ограничения
В данной версии имеется ограничение, cервер обрабатывает не более 15 одновременно открытых рыночных ордеров. В будущем это ограничение может быть изменено.

## Установка и запуск
Для установки достаточно скачать файлы советника из каталога `/src` или воспользоваться средствами `git clone`. Полученные файлы советника необходимо разместить в рабочую папку Metatrader: `{MetaTrader Data Folder}/MQL5/Experts/Advisors`. 

![Metatrader Data Folder](/img/data-folder.png "Metatrader Data Folder")

Также необходимо добавить адрес сервера `metatrader.live` в список разрешенных:.

![Metatrader Allow WebRequest](/img/allow-web-request.png "Metatrader Allow WebRequest")

После этого можно скомпилировать и запускать советника на любом ценовом графике, указав псевдоним для публикации (`Page name`) и частоту обновления данных.

![EA Input parameters](/img/input-parameters.png "EA Input parameters")

Советник выводит рабочие сообщения в закладку `Experts`.
Если все было сделано правильно, торговые данные уже доступны `online`. Можно открыть интернет-браузер и перейти по адресу `metatrader.live/accounts/{Page name}`.

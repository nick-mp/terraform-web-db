# Домашнее задание к занятию «Основы Terraform. Yandex Cloud»


### Задание 1

1. Изучите проект. В файле variables.tf объявлены переменные для Yandex provider.
2. Создайте сервисный аккаунт и ключ. [service_account_key_file](https://terraform-provider.yandexcloud.net).
4. Сгенерируйте новый или используйте свой текущий ssh-ключ. Запишите его открытую(public) часть в переменную **vms_ssh_public_root_key**.
5. Инициализируйте проект, выполните код. Исправьте намеренно допущенные синтаксические ошибки. Ищите внимательно, посимвольно. Ответьте, в чём заключается их суть.

```
variable "token" - не применяется.
variable "default_zone" - ошибка в названии при ссылке на переменную.
variable "folder_id"  - не указано значение, можно было указать в default
variable "cloud_id"   - не указано значение 
platform_id = "standart-v4" не известное значение "standarT-v4"
```

6. Подключитесь к консоли ВМ через ssh и выполните команду ``` curl ifconfig.me```.

8. Ответьте, как в процессе обучения могут пригодиться параметры ```preemptible = true``` и ```core_fraction=5``` в параметрах ВМ.

В качестве решения приложите:

- скриншот ЛК Yandex Cloud с созданной ВМ, где видно внешний ip-адрес;

   ![Task](https://github.com/nick-mp/terraform-web-db/blob/main/img/1-2.png)

- скриншот консоли, curl должен отобразить тот же внешний ip-адрес;

   ![Task](https://github.com/nick-mp/terraform-web-db/blob/main/img/1-1.png)


- ответы на вопросы.
### core_fraction=5 - Гарантированная доля vCPU которую мы получим будет равна 5%, preemptible = true - прерываемость машины (работает не более 24 ч.) оба параметра предоставляют существенную скидку на ВМ.

### Задание 2

1. Замените все хардкод-**значения** для ресурсов **yandex_compute_image** и **yandex_compute_instance** на **отдельные** переменные. К названиям переменных ВМ добавьте в начало префикс **vm_web_** .  Пример: **vm_web_name**.
2. Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их **default** прежними значениями из main.tf. 
3. Проверьте terraform plan. Изменений быть не должно. 

### Задание 3

1. Создайте в корне проекта файл 'vms_platform.tf' . Перенесите в него все переменные первой ВМ.
2. Скопируйте блок ресурса и создайте с его помощью вторую ВМ в файле main.tf: **"netology-develop-platform-db"** ,  ```cores  = 2, memory = 2, core_fraction = 20```. Объявите её переменные с префиксом **vm_db_** в том же файле ('vms_platform.tf').  ВМ должна работать в зоне "ru-central1-b"
3. Примените изменения.


   ![Task](https://github.com/nick-mp/terraform-web-db/blob/main/img/3-1.png)

### Задание 4

1. Объявите в файле outputs.tf **один** output , содержащий: instance_name, external_ip, fqdn для каждой из ВМ в удобном лично для вас формате.(без хардкода!!!)
2. Примените изменения.

В качестве решения приложите вывод значений ip-адресов команды ```terraform output```.


   ![Task](https://github.com/nick-mp/terraform-web-db/blob/main/img/4-1.png)


### Задание 5

1. В файле locals.tf опишите в **одном** local-блоке имя каждой ВМ, используйте интерполяцию ${..} с НЕСКОЛЬКИМИ переменными по примеру из лекции.
2. Замените переменные внутри ресурса ВМ на созданные вами local-переменные.
3. Примените изменения.


   ![Task](https://github.com/nick-mp/terraform-web-db/blob/main/img/5-1.png)


### Задание 6

1. Вместо использования трёх переменных  ".._cores",".._memory",".._core_fraction" в блоке  resources {...}, объедините их в единую map-переменную **vms_resources** и  внутри неё конфиги обеих ВМ в виде вложенного map(object).  
3. Создайте и используйте отдельную map(object) переменную для блока metadata, она должна быть общая для всех ваших ВМ.

5. Найдите и закоментируйте все, более не используемые переменные проекта.
6. Проверьте terraform plan. Изменений быть не должно.



   ![Task](https://github.com/nick-mp/terraform-web-db/blob/main/img/6-4.png)



------

## Дополнительное задание (со звёздочкой*)

**Настоятельно рекомендуем выполнять все задания со звёздочкой.**   
Они помогут глубже разобраться в материале. Задания со звёздочкой дополнительные, не обязательные к выполнению и никак не повлияют на получение вами зачёта по этому домашнему заданию. 


------
### Задание 7*

Изучите содержимое файла console.tf. Откройте terraform console, выполните следующие задания: 

1. Напишите, какой командой можно отобразить **второй** элемент списка test_list.


   ![Task](https://github.com/nick-mp/terraform-web-db/blob/main/img/7-1.png)


2. Найдите длину списка test_list с помощью функции length(<имя переменной>).


   ![Task](https://github.com/nick-mp/terraform-web-db/blob/main/img/7-2.png)


3. Напишите, какой командой можно отобразить значение ключа admin из map test_map.

   ![Task](https://github.com/nick-mp/terraform-web-db/blob/main/img/7-3.png)


4. Напишите interpolation-выражение, результатом которого будет: "John is admin for production server based on OS ubuntu-20-04 with X vcpu, Y ram and Z virtual disks", используйте данные из переменных test_list, test_map, servers и функцию length() для подстановки значений.

   ![Task](https://github.com/nick-mp/terraform-web-db/blob/main/img/7-4.png)


В качестве решения предоставьте необходимые команды и их вывод.

------

### Задание 8*
1. Напишите и проверьте переменную test и полное описание ее type в соответствии со значением из terraform.tfvars:
```
test = [
  {
    "dev1" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117",
      "10.0.1.7",
    ]
  },
  {
    "dev2" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@84.252.140.88",
      "10.0.2.29",
    ]
  },
  {
    "prod1" = [
      "ssh -o 'StrictHostKeyChecking=no' ubuntu@51.250.2.101",
      "10.0.1.30",
    ]
  },
]
```

   ![Task](https://github.com/nick-mp/terraform-web-db/blob/main/img/8-1.png)


2. Напишите выражение в terraform console, которое позволит вычленить строку "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117" из этой переменной.

   ![Task](https://github.com/nick-mp/terraform-web-db/blob/main/img/8-2.png)
------

------

### Задание 9* до конца не получилось разобраться со шлюзом

Используя инструкцию https://cloud.yandex.ru/ru/docs/vpc/operations/create-nat-gateway#tf_1, настройте для ваших ВМ nat_gateway. Для проверки уберите внешний IP адрес (nat=false) у ваших ВМ и проверьте доступ в интернет с ВМ, подключившись к ней через serial console. Для подключения предварительно через ssh измените пароль пользователя: ```sudo passwd ubuntu```

## 1. Ən çətin hesab etdiyiniz SQL sorğusu hansı oldu?
Mənim üçün ən çətin SQL sorğusu 3.15(a) tapşırığı oldu.
Bu tapşırıqda Brooklyn şəhərində yerləşən bütün bank filiallarında hesabı olan müştəriləri tapdım.Bu sorğunun çətin tərəfi yalnız bir filialda hesabı olan müştəriləri deyil, bütün Brooklyn filiallarında hesabı olan müştəriləri tapmaq idi. Bunun üçün iç-içə yazılmış `NOT EXISTS` ifadələrindən istifadə etdim.
Əvvəlcə Brooklyn şəhərindəki filialları seçdim. Daha sonra hər bir müştərinin həmin filialların hamısında hesabının olub-olmadığını yoxladıq.
Nəticədə bütün Brooklyn filiallarında hesabı olan müştərini tapa bildim.

## 2. Hansı sorğu üçün alt sorğu (subquery) istifadə etdiniz?
Alt sorğudan bir neçə tapşırıqda istifadə etdim. Bunlardan biri 3.25 tapşırığı idi.
Bu tapşırıqda büdcəsi Philosophy departamentinin büdcəsindən yüksək olan departamentlərin adlarını tapmalı idim.
Əvvəlcə alt sorğu vasitəsilə Philosophy departamentinin büdcəsini müəyyən etdim:
sql:
SELECT budget
FROM department
WHERE dept_name = 'Philosophy';
Sonra əsas sorğuda digər departamentlərin büdcəsini həmin nəticə ilə müqayisə etdim.
Bundan əlavə, `ORDER BY dept_name ASC` istifadə edərək nəticələri əlifba sırası ilə göstərdim.
Bu tapşırıq mənə alt sorğunun nəticəsindən əsas sorğuda necə istifadə etməyi öyrətdi.

## 3. JOIN istifadə etdiyiniz bir nümunəni izah edin.
`JOIN` istifadə etdiyimiz nümunələrdən biri 3.24 tapşırığı idi.
Bu tapşırıqda Accounting departamentində oxuyan və məsləhətçisi Physics departamentində işləyən tələbələri tapmalı idim.
Məlumatlar üç fərqli cədvəldə saxlanılırdı: `student`, `advisor` və `instructor`.
`student` cədvəlində tələbələrin məlumatları, `instructor` cədvəlində müəllimlərin məlumatları, `advisor` cədvəlində isə tələbə və məsləhətçi müəllim arasındakı əlaqə yerləşirdi.
Əvvəlcə `student` və `advisor` cədvəllərini tələbə ID-si vasitəsilə birləşdirdik. Daha sonra `advisor` və `instructor` cədvəllərini müəllim ID-si vasitəsilə əlaqələndirdim.
Sonda `WHERE` və `AND` istifadə edərək tələbənin Accounting, müəllimin isə Physics departamentində olmasını şərt kimi göstərdim.
Bu nümunə sayəsində `JOIN` əməliyyatının müxtəlif cədvəllərdəki əlaqəli məlumatları birləşdirmək üçün istifadə edildiyini daha yaxşı başa düşdüm.

## 4. SQL sorğularını yazarkən qarşılaşdığınız bir problemi və onun həllini izah edin.
SQL tapşırıqlarını yerinə yetirərkən qarşılaşdığım problemlərdən biri sorğuları yoxlamaq üçün verilənlər bazasında kifayət qədər məlumatın olmaması idi.
Məsələn, 3.24 tapşırığında Accounting departamentində oxuyan tələbələri tapmalı idim. Lakin əvvəl yaratdığım `student` cədvəlində bu departamentə aid tələbələr yox idi.
Buna görə də sorğunu düzgün yazsam belə, nəticə boş ola bilərdi.
Problemi həll etmək üçün `INSERT INTO` əmri vasitəsilə Accounting departamentinə aid nümunə tələbələr əlavə etdim. Daha sonra `advisor` cədvəlində həmin tələbələri müəllimlərlə əlaqələndirdim.

Bundan sonra SQL sorğusunu yenidən işlətdik və uyğun tələbələri nəticədə görə bildik.

Bu problem mənə göstərdi ki, SQL sorğusunun düzgün olması ilə yanaşı, verilənlər bazasında uyğun məlumatların mövcudluğu da vacibdir.

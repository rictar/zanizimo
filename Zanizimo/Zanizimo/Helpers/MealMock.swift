//
//  MealMock.swift
//  Zanizimo
//
//  Created by Ricardo Yepez on 1/29/19.
//  Copyright © 2019 Ricardo Yepez. All rights reserved.
//

import Foundation


struct MealMock {
    static func createWeekMenu() -> WeekMenu{
        let weekNumber = Date().weekNumberInYear()
        
        let menu = self.createWeekMenuMock(weekNumber: weekNumber)
        
        
        
        return menu
    }
    
    private static func createWeekMenuMock(weekNumber:Int) -> WeekMenu{
        
        var weekMenu = [DayMenu]()
        weekMenu.append(createDayMenu1Mock(dayNumber: 0))
        weekMenu.append(createDayMenu2Mock(dayNumber: 1))
        weekMenu.append(createDayMenu3Mock(dayNumber: 2))
        weekMenu.append(createDayMenu4Mock(dayNumber: 3))
        weekMenu.append(createDayMenu5Mock(dayNumber: 4))
        weekMenu.append(createDayMenu6Mock(dayNumber: 5))
        weekMenu.append(createDayMenu7Mock(dayNumber: 6))
        
        return WeekMenu(week: weekNumber, menu: weekMenu)
        
    }
    
    private static func createDayMenu3Mock(dayNumber:Int) -> DayMenu{
        var breakfast = Meal(name:"Huevos con jamon", classification:"Meat", typeMeal: .breakfast, ingredients:["Huevos": 1, "Jamon": 2])
        var snackOne = Meal(name:"Pepinos", classification:"Vegetables", typeMeal: .snackOne, ingredients:["Pepino": 1])
        var lunch = Meal(name:"Pechuga Asada", classification:"Meat", typeMeal: .lunch, ingredients: ["Pechuga":1,"Lechuga":1,"Jitomate":1])
        var snackTwo = Meal(name:"Cacahuates", classification:"Cacahuates", typeMeal: .snackOne, ingredients:["Pepino": 1])
        var dinner = Meal(name: "Gelatina", classification: "gelatina", typeMeal: .dinner, ingredients: ["Gelatina": 1])
        
        breakfast.imageUrlString = "https://www.philadelphia.com.mx/modx/assets/img/revision2016/images/recetas/26082014/Huevo-revuelto.jpg"
        snackOne.imageUrlString = "https://scontent-atl3-1.cdninstagram.com/vp/93ddc05d9c52c927be8a9c687aca819c/5C8A55E1/t51.2885-15/e35/43913182_1401009803363897_9026646858654406531_n.jpg"
        lunch.imageUrlString = "https://cdn.shopify.com/s/files/1/1850/4533/products/jelp-app-tijuana-pancake-place-pechuga_asada_530x_2x_f7851818-ae00-42ab-beae-c554f93a011d_530x@2x.png?v=1525560146"
        snackTwo.imageUrlString = "https://www.snacknomad.com/wp-content/uploads/2017/12/iStock-118429152-1300x836.jpg"
        dinner.imageUrlString = "https://rolloid.net/wp-content/uploads/2017/01/gelatina.jpg"

        var dayMenu = [Meal]()
        dayMenu.append(breakfast)
        dayMenu.append(snackOne)
        dayMenu.append(lunch)
        dayMenu.append(snackTwo)
        dayMenu.append(dinner)
        
        return DayMenu(day: dayNumber, menu: dayMenu)
    }
    
    
    private static func createDayMenu1Mock(dayNumber:Int) -> DayMenu{
        var breakfast = Meal(name:"Avena hervida con fruta", classification:"Fruta", typeMeal: .breakfast, ingredients:["Avena": 1, "Platano": 1, "Fresa":2])
        
        var snackOne = Meal(name:"Ensalada de lechuga ", classification:"Vegetables", typeMeal: .snackOne, ingredients:["Lechuga": 1, "Piña":1])
        
        var lunch = Meal(name:"Pechuga a la parrilla", classification:"Meat", typeMeal: .lunch, ingredients: ["Pechuga":1,"Brocoli":1,"Zanahoria":1, "Coliflor":1])
        
        var snackTwo = Meal(name:" Uvas", classification:"Fruta", typeMeal: .snackOne, ingredients:["Uvas":10])
        
        var dinner = Meal(name: "Jugo de naranja", classification: "Fruta", typeMeal: .dinner, ingredients: ["Naranja": 1])
        
        
        
        breakfast.imageUrlString = "https://ve.emedemujer.com/wp-content/uploads/sites/2/2014/09/Avena.jpg"
        
        snackOne.imageUrlString = "https://www.hogarmania.com/archivos/201804/6161-2-ensalada-de-lechugas-variadas-y-pina-xl-848x477x80xX.jpg"
        
        lunch.imageUrlString = "https://3.bp.blogspot.com/-5mgtMN678d0/VW_HFoG0ssI/AAAAAAAAATw/bq_1bhRcLZ8/s1600/comidas%2Bsaludables%2By%2Brapidas.jpg"
        
        snackTwo.imageUrlString = "https://www.elvergelecologico.com/img/lofblogs/articles/Uvas%20Ecol%C3%B3gicas.jpg"
        
        dinner.imageUrlString = "https://jugos.tips/wp-content/uploads/jugo-de-naranja-16x9.jpg"
        
        var dayMenu = [Meal]()
        dayMenu.append(breakfast)
        dayMenu.append(snackOne)
        dayMenu.append(lunch)
        dayMenu.append(snackTwo)
        dayMenu.append(dinner)
        
        return DayMenu(day: dayNumber, menu: dayMenu)
    }
    
    
    private static func createDayMenu2Mock(dayNumber:Int) -> DayMenu{
        var breakfast = Meal(name:"Bocadillo integral de atun", classification:"Meat", typeMeal: .breakfast, ingredients:["Pan": 1, "Atun": 1, "Pepino": 1, "Lechuga":1, "Aguacate":1, "Jitomate":1])
        
        var snackOne = Meal(name:"Melon con Queso Cottage", classification:"Fruta", typeMeal: .snackOne, ingredients:["Melon":1, "Queso":1])
        
        var lunch = Meal(name:"Salmon a la plancha", classification:"Fish", typeMeal: .lunch, ingredients: ["Salmon":1, "Arroz":1, "Zanahoria":1])
        
        var snackTwo = Meal(name:"Yogur natural con frutos del bosque", classification:"Lacteos", typeMeal: .snackOne, ingredients:["Yogur": 1, "Fresas":3, "Zarzamoras":3, "Moras":3])
        
        var dinner = Meal(name: "Jugo verde", classification: "Vegetables", typeMeal: .dinner, ingredients: ["Piña": 1, "Apio":1, "Nopal":1 ])
        
        
        
        breakfast.imageUrlString = "https://gymvirtual.com/wp-content/uploads/2015/03/IMG_8111.jpg"
        
        snackOne.imageUrlString = "https://d1nsq2txwd94q7.cloudfront.net/public/files/production/recipes/images/157/thumb/r_157_1475615012.jpg"
        
        lunch.imageUrlString = "https://1.bp.blogspot.com/-baKqUpWbkT4/T5lP9FRLucI/AAAAAAAACdQ/KkaL0fhkHTo/s1600/_MG_9592+-1.jpg"
        
        snackTwo.imageUrlString = "https://fuetmagazine.com/wp-content/uploads/2018/02/Berry-and-Chia-Yogurt-Parfait-Recipe.jpg"
        
        dinner.imageUrlString = "https://cdn2.cocinadelirante.com/sites/default/files/styles/gallerie/public/images/2018/05/jugo-verde-para-adelgazar-receta-facilicima.jpg"
        
        var dayMenu = [Meal]()
        dayMenu.append(breakfast)
        dayMenu.append(snackOne)
        dayMenu.append(lunch)
        dayMenu.append(snackTwo)
        dayMenu.append(dinner)
        
        return DayMenu(day: dayNumber, menu: dayMenu)
    }
    
    
    private static func createDayMenu4Mock(dayNumber:Int) -> DayMenu{
        var breakfast = Meal(name:"Omelette de queso con champiñones", classification:"Meat", typeMeal: .breakfast, ingredients:["Huevos": 2, "Champiñones": 2, "Queso": 1])
        
        var snackOne = Meal(name:"Jicama con zanahoria rallada ", classification:"Vegetables", typeMeal: .snackOne, ingredients:["Jicama": 1, "Zanahoria":1])
        
        var lunch = Meal(name:"Filete de Carne a la parrilla y vegetales", classification:"Meat", typeMeal: .lunch, ingredients: ["Filete de Res":1, "Brocoli":2, "Papa":1,"Jitomate":1])
        
        var snackTwo = Meal(name:"Puñado de frutos secos", classification:"Semillas", typeMeal: .snackOne, ingredients:["Nueces": 3, "Almendras":3, "Pistaches":3])
        
        var dinner = Meal(name: "Ensalada Campesina", classification: "Vegetables", typeMeal: .dinner, ingredients: ["Elote": 1, "Zanahoria":3, "Brocoli":2, "Papa":1])
        
        
        
        breakfast.imageUrlString = "https://imagenes.montevideo.com.uy/imgnoticias/201605/_W880_H495/563257.jpg"
        
        snackOne.imageUrlString = "https://i.ytimg.com/vi/_l6d58wwVH0/maxresdefault.jpg"
        
        lunch.imageUrlString = "https://polgrill.pl/wp-content/uploads/2014/06/steak.jpg"
        
        snackTwo.imageUrlString = "https://s5.eestatic.com/2018/07/17/actualidad/Actualidad_323229833_87430737_1706x960.jpg"
        
        dinner.imageUrlString = "https://www.holasabor.com/contenidos/images/cms_productos/ensaladacampecinaconjamonada_holasa-100925-1.JPG"
        
        var dayMenu = [Meal]()
        dayMenu.append(breakfast)
        dayMenu.append(snackOne)
        dayMenu.append(lunch)
        dayMenu.append(snackTwo)
        dayMenu.append(dinner)
        
        return DayMenu(day: dayNumber, menu: dayMenu)
    }
    
    
    
    private static func createDayMenu5Mock(dayNumber:Int) -> DayMenu{
        var breakfast = Meal(name:"Sandwich de Jamon ", classification:"Meat", typeMeal: .breakfast, ingredients:["Pan": 2, "Jamon": 2, "Queso": 1, "Lechuga":1, "Aguacate":1, "Jitomate":1])
        
        var snackOne = Meal(name:"Papaya Picada ", classification:"Frutos", typeMeal: .snackOne, ingredients:["Papaya":1])
        
        var lunch = Meal(name:"Pasta integral con espinacas", classification:"Pasta", typeMeal: .lunch, ingredients: ["Pasta Integral":1, "Espinacas":2, "Queso":1,"Jitomate":1])
        
        var snackTwo = Meal(name:"Yogur natural con frutos del bosque", classification:"Lacteos", typeMeal: .snackOne, ingredients:["Yogur": 1, "Fresas":3, "Zarzamoras":3, "Moras":3])
        
        var dinner = Meal(name: "Ensalada de lechuga con manzana", classification: "Vegetables", typeMeal: .dinner, ingredients: ["Lechuga": 1, "Manzana":1, "Tomates Cherry":2, "Zanahoria":1])
        
        
        
        breakfast.imageUrlString = "https://t2.uc.ltmcdn.com/images/5/5/9/img_como_hacer_un_sandwich_de_jamon_33955_600.jpg"
        
        snackOne.imageUrlString = "https://cdn.vogue.es/uploads/images/thumbs/201419/ideas_de_recetas_para_elaborar_con_frutas_pea_naranja_pepino_papaya_naranja_melon_manzana_mango_fresas_cereza_598105783_1200x.jpg"
        
        lunch.imageUrlString = "https://cdn2.salud180.com/sites/default/files/styles/medium/public/field/image/2012/10/pastafinal.jpg"
        
        snackTwo.imageUrlString = "https://www.lasirena.es/35648-product_ficha/yogur-natural-con-frutas-del-bosque.jpg"
        
        dinner.imageUrlString = "https://ukrainefood.info/uploads/img/x00000000000000000299.jpg"
        
        var dayMenu = [Meal]()
        dayMenu.append(breakfast)
        dayMenu.append(snackOne)
        dayMenu.append(lunch)
        dayMenu.append(snackTwo)
        dayMenu.append(dinner)
        
        return DayMenu(day: dayNumber, menu: dayMenu)
    }
    
    
    
    private static func createDayMenu6Mock(dayNumber:Int) -> DayMenu{
        var breakfast = Meal(name:"Sandwich de Pollo con Acelga", classification:"Meat", typeMeal: .breakfast, ingredients:["Pan": 2, "Pechuga": 1, "Acelga":1, "Queso":1])
        
        var snackOne = Meal(name:"Jicamas", classification:"Vegetables", typeMeal: .snackOne, ingredients:["Jicama": 1])
        
        var lunch = Meal(name:"Filete de Pescado", classification:"Meat", typeMeal: .lunch, ingredients: ["Pescado":1,"Pimientos":1,"Arroz":1])
        
        var snackTwo = Meal(name:"Batido de Frutos Rojos", classification:"Lacteos", typeMeal: .snackOne, ingredients:["Leche Descremada": 1, "Fresas":3, "Zarzamoras":3])
        
        var dinner = Meal(name: "Ensalada Fresca", classification: "Vegetables", typeMeal: .dinner, ingredients: ["Mango": 1, "Espinaca":1, "Semillas":1])
        
        
        
        breakfast.imageUrlString = "https://cdn.kiwilimon.com/recetaimagen/14209/th5-640x426-11960.jpg"
        
        snackOne.imageUrlString = "https://cdn.pixabay.com/photo/2017/05/22/18/52/jicamas-2334917_1280.jpg"
        
        lunch.imageUrlString = "https://st.depositphotos.com/1000230/1970/i/950/depositphotos_19701749-stock-photo-fish-fillet-with-rice-and.jpg"
        
        snackTwo.imageUrlString = "https://vilay.cl/images/blog/blog-thumb2.jpg"
        
        dinner.imageUrlString = "https://www.hogarmania.com/archivos/201412/5473-2-ensalada-de-espinacas-y-mango-xl-668x400x80xX.jpg"
        
        var dayMenu = [Meal]()
        dayMenu.append(breakfast)
        dayMenu.append(snackOne)
        dayMenu.append(lunch)
        dayMenu.append(snackTwo)
        dayMenu.append(dinner)
        
        return DayMenu(day: dayNumber, menu: dayMenu)
    }
    
    
    
    private static func createDayMenu7Mock(dayNumber:Int) -> DayMenu{
        var breakfast = Meal(name:"Enfrijoladas", classification:"Legumbres", typeMeal: .breakfast, ingredients:["Frijoles": 1, "Tortillas": 3, "Queso Panela":1])
        
        var snackOne = Meal(name:"Platano con manzana", classification:"Fruta", typeMeal: .snackOne, ingredients:["Platano": 1, "Manzana":1])
        
        var lunch = Meal(name:"Fajitas de Pollo)", classification:"Meat", typeMeal: .lunch, ingredients: ["Pechuga":1,"Arroz":1,"Cebolla":1, "Pimientos":2])
        
        var snackTwo = Meal(name:"Zanahoria rallada", classification:"Vegetables", typeMeal: .snackOne, ingredients:["Zanahorias": 3])
        
        var dinner = Meal(name: "Ensalada Tailandesa", classification: "Vegetables", typeMeal: .dinner, ingredients: ["Atun": 1, "Pepino":1, "Pimiento Morron":1])
            
            
            
            breakfast.imageUrlString = "https://www.superama.com.mx/views/micrositio/recetas/images/fiestaspatrias/enfrijoladas/Web_fotoreceta.jpg"
            
            snackOne.imageUrlString = "https://www.mallorcadiario.com/fotos/1/312068_manzanaplatano_thumb_660.jpg"
            
            lunch.imageUrlString = "https://d1uz88p17r663j.cloudfront.net/original/165D6276-811C-6377-B9D8-FF0000673B69-490x252-b-principal.png"
            
            snackTwo.imageUrlString = "https://actitudsaludable.net/wp-content/uploads/2016/11/biz-zanahoria.jpg"
            
            dinner.imageUrlString = "https://i.pinimg.com/originals/2c/c8/04/2cc804535a96de93703eb91c8d4f8134.jpg"
        
        var dayMenu = [Meal]()
        dayMenu.append(breakfast)
        dayMenu.append(snackOne)
        dayMenu.append(lunch)
        dayMenu.append(snackTwo)
        dayMenu.append(dinner)
        
        return DayMenu(day: dayNumber, menu: dayMenu)
    }
    
    
    
    
    
    
    
    
    
    
    
}

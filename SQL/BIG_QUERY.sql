SELECT 
    TABLA_2.index_id,
    TABLA_2.cut,
    TABLA_2.color,
    TABLA_2.clarity,
    TABLA_2.price,
    TABLA_2.city,
    TABLA_2.carat,
    diamonds_dimensions.depth,
    diamonds_dimensions."table",
    diamonds_dimensions.x,
    diamonds_dimensions.y,
    diamonds_dimensions.z



 FROM
    (SELECT 
    TABLA_1.index_id,
    TABLA_1.cut,
    TABLA_1.color,
    TABLA_1.clarity,
    TABLA_1.price,
    TABLA_1.carat,
    diamonds_city.city
    FROM
        (SELECT 
            diamonds_properties.index_id,
            diamonds_cut.cut,
            diamonds_color.color,
            diamonds_clarity.clarity,
            diamonds_transactional.price,
            diamonds_transactional.carat,
            diamonds_transactional.city_id


        FROM diamonds_properties
        INNER JOIN diamonds_cut ON diamonds_properties.cut_id = diamonds_cut.cut_id
        INNER JOIN diamonds_color ON diamonds_properties.color_id = diamonds_color.color_id
        INNER JOIN diamonds_clarity ON diamonds_properties.clarity_id = diamonds_clarity.clarity_id
        INNER JOIN diamonds_transactional ON diamonds_properties.index_id = diamonds_transactional.index_id
        ) TABLA_1
        INNER JOIN diamonds_city ON TABLA_1.city_id = diamonds_city.city_id
    )TABLA_2
    INNER JOIN diamonds_dimensions ON TABLA_2.index_id = diamonds_dimensions.index_id
    
Config = {}

-- Se recomienda que en el label si no quieres que haya texto y que no haya bug pon un espacio más que el otro. En proximas actualizaciones se arreglara

Config.Elevators = {
    {
        name = "Ascensor Central", -- Nombre del ascensor
        floors = {
            {label = "", planta = "1", coords = vector3(205.0, -915.0, 30.0)},
            {label = " ", planta = "2", coords = vector3(207.0, -918.0, 30.0)},
            {label = "  ", planta = "3", coords = vector3(210.0, -915.0, 40.0)}
        }
    },
    -- Puedes añadir más ascensores y plantas aquí
}

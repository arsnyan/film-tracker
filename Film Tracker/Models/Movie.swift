//
//  Film.swift
//  Film Tracker
//
//  Created by Арсен Саруханян on 14.05.2025.
//

struct Movie {
    let name: String
    let releaseYear: Int
    let rating: Double
    let coverUrl: String
    
    static func getMovies() -> [Movie] {
        [
            Movie(name: "The Shawshank Redemption", releaseYear: 1994, rating: 9.3, coverUrl: "https://m.media-amazon.com/images/M/MV5BMDAyY2FhYjctNDc5OS00MDNlLThiMGUtY2UxYWVkNGY2ZjljXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg"),
            Movie(name: "The Godfather", releaseYear: 1972, rating: 9.2, coverUrl: "https://m.media-amazon.com/images/M/MV5BNGEwYjgwOGQtYjg5ZS00Njc1LTk2ZGEtM2QwZWQ2NjdhZTE5XkEyXkFqcGc@._V1_.jpg"),
            Movie(name: "The Dark Knight", releaseYear: 2008, rating: 9.0, coverUrl: "https://i.scdn.co/image/ab67616d0000b273adeca9303f5b181b46f9a2c1"),
            Movie(name: "Pulp Fiction", releaseYear: 1994, rating: 8.9, coverUrl: "https://m.media-amazon.com/images/I/71ox+EoFO7L._UF894,1000_QL80_.jpg"),
            Movie(name: "Schindler's List", releaseYear: 1993, rating: 9.0, coverUrl: "https://upload.wikimedia.org/wikipedia/en/3/38/Schindler%27s_List_movie.jpg"),
            Movie(name: "The Lord of the Rings: The Return of the King", releaseYear: 2003, rating: 8.9, coverUrl: "https://m.media-amazon.com/images/I/61I+emCM3eL._AC_UF894,1000_QL80_.jpg"),
            Movie(name: "Forrest Gump", releaseYear: 1994, rating: 8.8, coverUrl: "https://m.media-amazon.com/images/M/MV5BNDYwNzVjMTItZmU5YS00YjQ5LTljYjgtMjY2NDVmYWMyNWFmXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg"),
            Movie(name: "Inception", releaseYear: 2010, rating: 8.8, coverUrl: "https://m.media-amazon.com/images/I/81CgNB2mglL._UF894,1000_QL80_.jpg"),
            Movie(name: "Fight Club", releaseYear: 1999, rating: 8.8, coverUrl: "https://m.media-amazon.com/images/I/71TdVILcp9L._AC_UF894,1000_QL80_.jpg"),
            Movie(name: "The Matrix", releaseYear: 1999, rating: 8.7, coverUrl: "https://media-cache.cinematerial.com/p/500x/3loqorvq/the-matrix-movie-cover.jpg?v=1456805952"),
            Movie(name: "Goodfellas", releaseYear: 1990, rating: 8.7, coverUrl: "https://ih1.redbubble.net/image.5189660681.8025/flat,750x,075,f-pad,750x1000,f8f8f8.u1.jpg"),
            Movie(name: "The Silence of the Lambs", releaseYear: 1991, rating: 8.6, coverUrl: "https://m.media-amazon.com/images/M/MV5BNDdhOGJhYzctYzYwZC00YmI2LWI0MjctYjg4ODdlMDExYjBlXkEyXkFqcGc@._V1_.jpg"),
            Movie(name: "Se7en", releaseYear: 1995, rating: 8.6, coverUrl: "https://upload.wikimedia.org/wikipedia/en/6/68/Seven_%28movie%29_poster.jpg"),
            Movie(name: "The Green Mile", releaseYear: 1999, rating: 8.6, coverUrl: "https://m.media-amazon.com/images/I/71RjQDD8X4L._AC_UF894,1000_QL80_.jpg"),
            Movie(name: "Interstellar", releaseYear: 2014, rating: 8.6, coverUrl: "https://cdn.kinocheck.com/i/tz0ag6xk6y.jpg"),
            Movie(name: "Parasite", releaseYear: 2019, rating: 8.6, coverUrl: "https://m.media-amazon.com/images/I/A1bmSck4-HL._UF894,1000_QL80_.jpg"),
            Movie(name: "The Pianist", releaseYear: 2002, rating: 8.5, coverUrl: "https://m.media-amazon.com/images/I/91a6Qt5BtsL._AC_UF894,1000_QL80_.jpg"),
            Movie(name: "Gladiator", releaseYear: 2000, rating: 8.5, coverUrl: "https://m.media-amazon.com/images/I/61O9+6+NxYL._UF1000,1000_QL80_.jpg"),
            Movie(name: "The Departed", releaseYear: 2006, rating: 8.5, coverUrl: "https://upload.wikimedia.org/wikipedia/en/5/50/Departed234.jpg"),
            Movie(name: "Whiplash", releaseYear: 2014, rating: 8.5, coverUrl: "https://media1.jpc.de/image/w1155/front/0/4030521739321.jpg")
        ].shuffled()
    }
}

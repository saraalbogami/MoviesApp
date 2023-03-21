//
//  MoviesData.swift
//  MoviesApp
//
//  Created by Amaal Almutairi on 27/08/1444 AH.
//

// This file was generated from JSON Schema using codebeautify, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome9 = try Welcome9(json)

import Foundation





//struct MoviesData:Codable {
//    
//    var id = ==UUID(uuidString: "")
//    var movie_name:String
//    var movie_poste:String
//    var movie_story:String
//    var movie_duration:String
//    var movie_genres:[String]
//    var movie_watcher_type:String
//    var movie_IMDb_rate:Double
//    var movie_language:String
//    
//}

struct MoviesData: Codable {
    let id, movieName: String
    let moviePoster: String
    let movieStory, movieDuration: String
    let movieGenres: [String]
    let movieWatcherType: String
    let movieIMDBRate: Double
    let movieLanguage: String

    enum CodingKeys: String, CodingKey {
        case id
        case movieName = "movie_name"
        case moviePoster = "movie_poster"
        case movieStory = "movie_story"
        case movieDuration = "movie_duration"
        case movieGenres = "movie_genres"
        case movieWatcherType = "movie_watcher_type"
        case movieIMDBRate = "movie_IMDb_rate"
        case movieLanguage = "movie_language"
    }
}



struct RateMovie: Codable {
    let id, movieID, directorID: String

    enum CodingKeys: String, CodingKey {
        case id
        case movieID = "movie_id"
        case directorID = "director_id"
    }
}


//
//struct Actors: Codable {
//    let id, actorName: String
//    let actorImage: String
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case actorName = "actor_name"
//        case actorImage = "actor_image"
//    }
//}

//typealias Welcome = [Actors]


//struct Director: Codable {
//    let id, directorName: String
//    let directorImage: String
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case directorName = "director_name"
//        case directorImage = "director_image"
//    }
//}
//
//typealias WelcomeDirector = [Director]

//
//struct Actors:Codable {
//    var id = UUID(uuidString: "")
//    var actor_name:String
//    var actor_image:String
//}
//
//struct Director:Codable {
//    var id = UUID(uuidString: "")
//    var director_name:String
//    var director_image:String
//}
//




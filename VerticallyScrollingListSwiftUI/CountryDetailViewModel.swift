//
//  CountryDetailViewModel.swift
//  VerticallyScrollingListSwiftUI
//
//  Created by Rishab Sudhir on 12/06/23.
//

import Foundation
class CountriesDetailViewModel {
    
    //MARK: - Variables
    var countryDetailsArray = [CountryDetail]() // Array which will contain the data for all the countries
    private let countryNames = ["Switzerland","France","Belgium","Germany","Netherlands","Finland","Spain"]
    private let descriptionsList = ["""
                                    Switzerland is a captivating destination offering breathtaking landscapes, from majestic mountains to serene lakes, making it a haven for nature lovers. Its charming cities like Zurich, Geneva, and Lucerne boast a harmonious blend of rich history, cultural heritage, and modern amenities. Visitors can indulge in exhilarating outdoor activities, explore picturesque towns, and experience Swiss hospitality, while being immersed in a country renowned for its chocolate, cheese, and precision craftsmanship.
                                    """
                                    ,
                                    """
                                    France is a captivating country that beckons travelers with its iconic landmarks, rich history, and exquisite cuisine. From the romantic streets of Paris to the sun-kissed beaches of the French Riviera, France offers diverse experiences for every kind of traveler. Immerse yourself in the art and culture of Paris, wander through charming villages in the countryside, and indulge in world-class gastronomy, all while surrounded by stunning architecture, picturesque landscapes, and a vibrant atmosphere that truly embodies the essence of the French lifestyle.
                                    """
                                    ,
                                    """
                                    Belgium is a charming destination known for its picturesque cities, medieval architecture, and delicious culinary delights. From the stunning Grand Place in Brussels to the historic canals of Bruges, Belgium offers a blend of old-world charm and vibrant modernity. Indulge in mouthwatering Belgian chocolates, savor world-renowned beers, and explore the country's rich cultural heritage, including impressive castles, museums, and art galleries. With its warm hospitality and unique blend of Flemish and French influences, Belgium is a must-visit for those seeking a delightful and enriching European experience.
                                    """
                                    ,
                                    """
                                    Germany is a captivating country that offers a diverse range of experiences for travelers. From the bustling streets of Berlin to the fairy-tale landscapes of the Bavarian Alps, Germany has something to offer everyone. Discover the rich history and architecture in cities like Munich and Cologne, explore charming medieval towns such as Rothenburg ob der Tauber, and indulge in world-class beer and sausages. Whether you're interested in vibrant culture, stunning natural beauty, or fascinating history, Germany is a destination that promises an unforgettable adventure.
                                    """
                                    ,
                                    """
                                    The Netherlands is a captivating country renowned for its picturesque canals, vibrant tulip fields, and charming windmills. Explore the enchanting city of Amsterdam with its historic architecture and world-class museums, or cycle through the scenic countryside dotted with traditional Dutch villages. Immerse yourself in Dutch culture, visit iconic landmarks like the Anne Frank House and Keukenhof Gardens, and indulge in delicious Dutch treats such as stroopwafels and cheese. With its friendly locals, beautiful landscapes, and rich cultural heritage, the Netherlands is a destination that offers a delightful blend of history, art, and natural beauty.
                                    """
                                    ,
                                    """
                                    Finland is a captivating destination known for its pristine nature, enchanting landscapes, and unique Arctic experiences. Immerse yourself in the magical beauty of the Finnish Lapland, where you can witness the mesmerizing Northern Lights and enjoy thrilling winter activities like husky sledding and snowshoeing. Explore the vibrant capital city of Helsinki with its modern design, historic landmarks, and bustling market squares. Finland's vast forests, thousands of lakes, and saunas offer opportunities for relaxation and outdoor adventures throughout the year. With its distinct culture, warm hospitality, and untouched wilderness, Finland is a must-visit destination for nature lovers and seekers of tranquility.
                                    """
                                    ,
                                    """
                                    Spain is a captivating country that entices visitors with its rich history, vibrant culture, and stunning landscapes. Explore the architectural wonders of Barcelona, including the famous Sagrada Familia and Park Güell, or wander through the historic streets of Madrid and immerse yourself in its lively atmosphere. Relax on the beautiful beaches of Costa del Sol or discover the vibrant flamenco culture in Seville. With its delicious cuisine, world-renowned art, and a diverse range of experiences, Spain offers a delightful blend of history, culture, and natural beauty that leaves a lasting impression on every traveler.
                                    """]
    
    // MARK: - Initializer
    init() {
        setupCountryDetail()
    }
    
    private func setupCountryDetail(){
        for i in 0...(descriptionsList.count-1){
            let SinglecountryDetail = CountryDetail(name:countryNames[i], description: descriptionsList[i])
            countryDetailsArray.append(SinglecountryDetail)
        }
    }
}

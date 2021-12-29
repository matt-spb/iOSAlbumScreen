import Foundation

struct CellOption {
    let title: String
    let iconName: String
    let number: Int
    var albumOwner: String? = nil
}

struct Model {
    enum sectionType: String {
        case myAlbums = "My Albums"
        case sharedAlbums = "Shared Albums"
        case peopleAndPlaces = "People & Places"
        case mediaTypes = "Media Types"
        case Utilities = "Utilities"
    }

    var myAlbums: [CellOption]
    var sharedAlbums: [CellOption]
    var peopleAndPlaces: [CellOption]
    var mediaTypes: [CellOption]
    var utilities: [CellOption]
    var sectionTitles: [[String: String]]
    var type: sectionType?

    init() {
        myAlbums = []
        sharedAlbums = []
        peopleAndPlaces = []
        mediaTypes = []
        utilities = []
        sectionTitles = []
    }

    init(myAlbums: [CellOption], type: sectionType) {
        self.init()
        self.myAlbums = myAlbums
        self.type = type
    }

    init(sharedAlbums: [CellOption], type: sectionType) {
        self.init()
        self.sharedAlbums = sharedAlbums
        self.type = type
    }

    init(peopleAndPlaces: [CellOption], type: sectionType) {
        self.init()
        self.peopleAndPlaces = peopleAndPlaces
        self.type = type
    }


    public mutating func configure() {

        sectionTitles = [["My Albums": "See all"],
                             ["Shared Albums": "See all"],
                             ["People & Places": ""],
                             ["Media Types": ""],
                             ["Utilities": ""]
        ]

        myAlbums.append(CellOption(title: "Recent", iconName: "image_1", number: 3170))
        myAlbums.append(CellOption(title: "Instagram", iconName: "image_2", number: 103))
        myAlbums.append(CellOption(title: "WatsApp", iconName: "image_3", number: 22))
        myAlbums.append(CellOption(title: "inShot", iconName: "image_4", number: 5))
        myAlbums.append(CellOption(title: "Favourites", iconName: "image_5", number: 145))
        myAlbums.append(CellOption(title: "InstaSize", iconName: "image_6", number: 3))
        myAlbums.append(CellOption(title: "Twitter", iconName: "image_7", number: 4))
        myAlbums.append(CellOption(title: "Yandex.Drive", iconName: "image_8", number: 1))

        sharedAlbums.append(CellOption(title: "Nature", iconName: "image_5", number: 0, albumOwner: "Vera"))

        peopleAndPlaces.append(CellOption(title: "People", iconName: "image_4", number: 13))
        peopleAndPlaces.append(CellOption(title: "Places", iconName: "image_5", number: 2115))

        mediaTypes.append(CellOption(title: "Videos", iconName: "video", number: 255))
        mediaTypes.append(CellOption(title: "Selfies", iconName: "person.crop.square", number: 114))
        mediaTypes.append(CellOption(title: "Live Photos", iconName: "livephoto", number: 134))
        mediaTypes.append(CellOption(title: "Portrait", iconName: "cube", number: 3))
        mediaTypes.append(CellOption(title: "Panoramas", iconName: "pano", number: 8))
        mediaTypes.append(CellOption(title: "Slo-mo", iconName: "slowmo", number: 3))
        mediaTypes.append(CellOption(title: "Bursts", iconName: "photo.on.rectangle", number: 3))
        mediaTypes.append(CellOption(title: "Screenshots", iconName: "camera.viewfinder", number: 498))

        utilities.append(CellOption(title: "Imports", iconName: "square.and.arrow.down", number: 101))
        utilities.append(CellOption(title: "Hidden", iconName: "eye.slash", number: 0))
        utilities.append(CellOption(title: "Recently Deleted", iconName: "trash", number: 1))
    }
}


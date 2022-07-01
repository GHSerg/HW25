import Foundation

struct Cards: Decodable {
    let cards: [Card]
}

struct Card: Decodable {
    let name: String?
    let manaCost: String?
    let type: String?
    let rarity: String?
    let setName: String?
    let artist: String?
    let number: String?
}

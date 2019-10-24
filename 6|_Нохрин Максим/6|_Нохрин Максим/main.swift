//
//  main.swift
//  6|_Нохрин Максим
//
//  Created by Maksim on 23/10/2019.
//  Copyright © 2019 Ololo. All rights reserved.
//

import Foundation

print("Hello, World!")

protocol Content {
    var title: String { get set }
    
    var duration: Int { get }
}

class Video: Content {
    var title: String
    
    var duration: Int
    
    var videoQuality: Int = 720
    
    var videoGenge: String = "Наука"
    
    init (title: String, duration: Int) {
        self.title = title
        self.duration = duration
    }
}

class Audio: Content {
    var title: String
    
    var duration: Int
    
    var audioQuality: Int = 120
    
    var musicGenre: String = "Поп"
    
    init (title: String, duration: Int) {
        self.title = title
        self.duration = duration
    }
    
}

struct Playlist<T: Content> {
    var list = [T]()
    
    var currentTrack: Int = 0
    
    mutating func push (_ element: T) {
        list.append(element)
    }
    
    mutating func removeFirst () -> T {
        list.removeFirst()
    }
    
    mutating func filter (closure: (T) -> Bool) {
        var newList = [T]()
        for track in list {
            if closure(track) {
                newList.append(track)
            }
        }
        list = newList
        print("Фильтр применен")
    }
    
    func printList() {
        print("В плейлисте находятся следующие композиции:")
        for track in list {
            print(track.title)
        }
    }
    
    subscript(index: Int) -> T? {
        if index >= list.count || index < 0 {
            return nil
        } else {
            return list[index]
        }
    }
}

var playlistAudio = Playlist<Audio>()
playlistAudio.push(Audio(title: "Программирование", duration: 50))
playlistAudio.push(Audio(title: "Лепс", duration: 5))
playlistAudio.push(Audio(title: "Бузова", duration: 4))

playlistAudio.printList()

playlistAudio.filter { track -> Bool in
    return track.title == "Лепс"
}

playlistAudio.printList()

print(playlistAudio[0])
print(playlistAudio[1])


//
//  LikedSongsViewController.swift
//  Modal
//
//  Created by COTEMIG on 01/07/25.
//

import UIKit

class LikedSongsViewController: UIViewController, UITableViewDataSource{

    
    @IBOutlet weak var likedSongsTableView: UITableView!
    
    
    
        let musicList: [MusicData] = [
            MusicData(title: "Amazing Grace", artist: "John Newton"),
            MusicData(title: "Bohemian Rhapsody", artist: "Queen"),
            MusicData(title: "Billie Jean", artist: "Michael Jackson"),
            MusicData(title: "Hotel California", artist: "Eagles"),
            MusicData(title: "Stairway to Heaven", artist: "Led Zeppelin"),
            MusicData(title: "Smells Like Teen Spirit", artist: "Nirvana"),
            MusicData(title: "Imagine", artist: "John Lennon"),
            MusicData(title: "One", artist: "U2"),
            MusicData(title: "Hallelujah", artist: "Leonard Cohen"),
            MusicData(title: "Shape of You", artist: "Ed Sheeran")
        ]

        

        override func viewDidLoad() {
            super.viewDidLoad()

           
            self.likedSongsTableView.dataSource = self

            
            self.likedSongsTableView.tableFooterView = UIView()

            
            self.title = "Minhas Curtidas"
        }

       
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return musicList.count
        }

        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath) as? MusicTableViewCell else {
                
                fatalError("Não foi possível carregar a célula como MusicTableViewCell")
            }

            
            let music = musicList[indexPath.row]

            
            cell.musicTitleLabel.text = music.title
            cell.artistNameLabel.text = music.artist

            
            return cell
        }

}

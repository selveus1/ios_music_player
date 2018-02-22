//
//  GenreButtonScreen.swift
//  MusicPlayerI
//
//  Created by Athena on 2/22/18.
//  Copyright © 2018 Sheena Elveus. All rights reserved.
//

import UIKit
import MediaPlayer
class GenreButtonScreen: UIViewController {

    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    
    
    @IBAction func genreButtonPressed(_ sender: Any) {
        
        MPMediaLibrary.requestAuthorization{ (status) in
            if status == .authorized{
                print((sender as AnyObject).currentTitle as! String)
                self.playGenre(genre: (sender as AnyObject).currentTitle as! String)
            }
            
        }
        
        
        
        
    }
    

    @IBAction func stopButtonPressed(_ sender: Any) {
        musicPlayer.stop()
    }
    
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        musicPlayer.skipToNextItem()
    }
    
    
    func playGenre(genre: String){
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }



}

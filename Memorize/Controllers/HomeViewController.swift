//
//  HomeViewController.swift
//  Memorize
//
//  Created by Wilson on 16/03/21.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    private var numOfObjects: Int = 12
    
    private var data: Array<String> = []
    
    private var objects: Array<ObjectStatus> = []
    
    private var defaultImage = "question-mark.png"
    
    private var images = ["tennis.png", "volleyball.png", "football.png", "golf-ball.png", "rugby-ball.png", "basketball-ball.png"]
    
    private var selectedIndex: Array<Int> = []
    
    private var selectedImages: Array<Int> = []
    
    private var currentSelectedObject: ObjectStatus? = nil
    
    private var score: Int = 0
    
    private var currentIndex: Int = -1
    
    var playerNameProvided: String?
    
    @IBOutlet var playerName: UILabel?
    
    @IBOutlet var playerScore: UILabel?
    
    @IBOutlet var imageTrophyWin: UIImageView?
    
    @IBOutlet var labelWin: UILabel?
    
    @IBOutlet var collectionView: UICollectionView?
    
    
    override func viewDidLoad() {
        self.initializeCollectionView()
        self.updateScore(value: 0)
        
        self.collectionView?.register(UINib(nibName: "CustomCollectionViewCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "customCollection")
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCollection", for: indexPath) as! CustomCollectionViewCollectionViewCell
        
        if (!self.objects[indexPath.row].isFinished()){
            let imageOfTheButton = self.objects[indexPath.row].getImage()
            
            cell.setImage(name: imageOfTheButton)
        }else{
            cell.imageView?.image = nil
        }
        
        if (self.hasWinner()){
            self.imageTrophyWin?.isHidden = false
            self.labelWin?.isHidden = false
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if (self.objects[indexPath.row].isFinished()){
            return
        }
        
        if (self.currentSelectedObject == nil){
            
            self.updateCurrentIndex(index: indexPath.row)
            self.updateObjectStatusState(index: self.currentIndex, newImage: self.data[self.currentIndex], finished: false)
            
        }else{
            
            if (self.currentSelectedObject!.getImage() == self.data[indexPath.row]){
                
                self.updateObjectStatusState(index: self.currentIndex, newImage: "", finished: true)
                
                self.updateObjectStatusState(index: indexPath.row, newImage: "", finished: true)
                
                self.updateCurrentIndex(index: -1)
                
                self.updateScore(value: 10)
            }else{
                
               self.updateObjectStatusState(index: self.currentIndex, newImage: defaultImage, finished: false)
                    
               self.updateCurrentIndex(index: -1)
                    
               self.updateScore(value: -5)
                
            }
        }
        
        self.collectionView?.reloadData()
    }
    
    private func updateCurrentIndex(index: Int){
        if (index == -1){
            self.currentSelectedObject = nil
        }else{
            self.currentSelectedObject = self.objects[index]
        }
        self.currentIndex = index
    }
    
    private func updateObjectStatusState(index: Int, newImage: String, finished: Bool){
        if (finished){
            self.objects[index].setImageToNil()
        }else{
            self.objects[index].setImage(image: newImage)
        }
        self.objects[index].setFinished(boolean: finished)
    }
    
    private func updateScore(value: Int){
        self.score += value
        if (self.score < 0){
            self.score = 0
        }
        self.playerScore!.text = "(" + String(self.score) + ")"
    }
    
    private func hasWinner() -> Bool {
        var gameWin = true;
        for item in self.objects{
            if (!item.isFinished()){
                gameWin = false
            }
        }
        return gameWin
    }
    
    private func initializeCollectionView(){
        self.imageTrophyWin?.isHidden = true
        self.labelWin?.isHidden = true
        self.playerName?.text = self.playerNameProvided
        
        for n in 0...self.numOfObjects - 1{
            self.data.append(self.defaultImage)
            self.objects.append(ObjectStatus(image: defaultImage, found: false, finished: false))
        }
        
        for n in 0...(self.numOfObjects / 2) - 1{
            var firstIndex  = Int.random(in: 0..<self.numOfObjects)
            var secondIndex = Int.random(in: 0..<self.numOfObjects)
            var imagesIndex = Int.random(in: 0..<self.numOfObjects/2)
            
            while (self.selectedIndex.contains(firstIndex)){
                firstIndex = Int.random(in: 0..<self.numOfObjects)
            }
            self.selectedIndex.append(firstIndex)
            
            while (self.selectedIndex.contains(secondIndex) ||
                   secondIndex == firstIndex){
                secondIndex = Int.random(in: 0..<self.numOfObjects)
            }
            self.selectedIndex.append(secondIndex)
            
            while (self.selectedImages.contains(imagesIndex)){
                imagesIndex = Int.random(in: 0..<self.numOfObjects/2)
            }
            
            self.data[firstIndex] = self.images[imagesIndex]
            self.data[secondIndex] = self.images[imagesIndex]
            self.selectedImages.append(imagesIndex)
            
        }
    }

}

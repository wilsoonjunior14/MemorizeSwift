//
//  ObjectStatus.swift
//  Memorize
//
//  Created by Wilson on 16/03/21.
//

class ObjectStatus {
    
    var image: String?
    var found: Bool?
    var finished: Bool?
    
    init(image: String, found: Bool, finished: Bool){
        self.image = image
        self.found = found
        self.finished = found
    }
    
    public func setFinished(boolean: Bool) -> Void{
        self.finished = boolean
    }
    
    public func isFinished() -> Bool {
        return self.finished!
    }
    
    public func getImage() -> String {
        return self.image!
    }
    
    public func setImage(image: String) -> Void{
        self.image = image
    }
    
    public func setImageToNil() -> Void{
        self.image = nil
    }
    
    public func toString() -> Void {
        print (String(self.image!) + ", " + String(self.finished!))
    }
    
}

//
//  Message.swift

import Foundation

class Message : NSObject, JSQMessageData {
    var text_: String
    var sender_: String
    var date_: NSDate
    var imageUrl_: String?
    var channel_: String?
 
    
    convenience init(channel: String?, sender: String?) {
        
        self.init(text: "", sender: sender, imageUrl: "")
        self.channel_=channel!

    }
    
    convenience init(text: String?, sender: String?) {
        self.init(text: text, sender: sender, imageUrl: nil)
    }
    
    init(text: String?, sender: String?, imageUrl: String?) {
        if(text == nil){
           self.text_ = "hei"
            self.sender_ = "anna"
        }else{

        self.text_ = text!
        self.sender_ = sender!
        }
        self.date_ = NSDate()
        self.imageUrl_ = "https://pbs.twimg.com/profile_images/638161082108895232/Y-svrKRX_400x400.jpg"
        }
   
   
    
    func text() -> String! {
        return text_;
    }
    
    func channel() -> String! {
        return channel_;
    }

    
    func sender() -> String! {
        return sender_;
    }
    
    func date() -> NSDate! {
        return date_;
    }
    
    func imageUrl() -> String? {
        return imageUrl_;
    }
}
//
//  ChannelViewController.swift

import UIKit

let channelController = ChannelController()
class ChannelViewController: UITableViewController {
    var channel: String!
    
    // MARK: Properties
    
    var messages = [Message]()
  
    override func viewDidLoad() {
        channelController.setupFirebase()

        super.viewDidLoad()
        self.channel = "kanava"
        
        // Load the sample data.
        loadChannels()
    
    }
    
    func loadChannels() {
        
        delay(2.0) {
            
            self.messages = channelController.getChannels()
            print(self.messages.count)
            if(self.messages.capacity > 0){
                
                self.channel = self.messages[0].channel()
           }
 
            self.tableView?.reloadData()
        }
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let indexPath = tableView.indexPathForSelectedRow
        
        let currentCell = tableView.cellForRowAtIndexPath(indexPath!)! as! ChannelTableViewCell
        self.channel = currentCell.channelLabel.text
        print(currentCell.channelLabel.text)
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "ChannelCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ChannelTableViewCell
        
        // Fetches the appropriate message for the data source layout.
        
        // Fetches the appropriate message for the data source layout.
        let message = messages[indexPath.row]
        
       // cell.channelName.text = message.sender()
        cell.channelLabel.text = message.channel()
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            messages.removeAtIndex(indexPath.row)
           
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetail" {
            
            print("Swiching to chat now.")
            let mealDetailViewController = segue.destinationViewController as! MessagesViewController
           mealDetailViewController.channel = self.channel
             print(sender) //  UIBarButtonItem
            mealDetailViewController.channel = channel
            // Get the cell that generated this segue.
            if let selectedMealCell = sender as? ChannelTableViewCell {
                print("Channel: ")

                let indexPath = tableView.indexPathForCell(selectedMealCell)!
                let selectedChannel = messages[indexPath.row].channel()
                print(messages[indexPath.row])
                mealDetailViewController.channel = selectedChannel
                print(selectedChannel)
            }
        }
        
    }
    
    
}

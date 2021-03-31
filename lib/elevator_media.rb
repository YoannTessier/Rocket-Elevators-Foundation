module ElevatorMedia
    class Streamer
        
        def self.getContent(media)
            return "<div> #{spotify} </div>" if media == "spotify"
            return "<div> #{flights} </div>" if media == "flights"
        end

        def self.spotify
            '<iframe src="https://open.spotify.com/embed/track/00Y9r5SfbDdEjJhNg7laQr" width="300" height="380" frameborder="0" allowtransparency="true" allow="encrypted-media"></iframe>'
        end
        
        def self.flights        
            '<iframe src="http://embed.flightaware.com/commercial/integrated/web/delay_map.rvt" width="675" height="410" frameborder="0" marginheight="0" marginwidth="0"></iframe><br /><div style="font-size: x-small;"><a href="https://flightaware.com/">'
        end

    end
end

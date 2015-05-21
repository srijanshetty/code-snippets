// Taken from David Walsh's blog
var events = (function() {
    var topics = {};
    
    return {
        subscribe: function(topic, listener) {
            if (!topics[topic]) {
                topics[topic] = {
                    queue: []
                };
            }
            
            var index = topics[topic].queue.push(listener);
            
            return (function (index) {
                return {
                    remove: function() {
                        delete topics[topic].queue[index]
                    }
                };
            })(index);
        },
        
        publish: function(topic, info) {
            if( !topics[topic] || !topics[topic].queue.length) {
                return ;
            }
            
            topics[topic].queue.forEach(function(element) {
                element(info || {});
            });
        }
    };
})();
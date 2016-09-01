

return function (size)
    local obj = {}
    local queue = {}
    local head, tail = 0, 0
    local length = size or 256

    function obj.enqueue(item)
        assert(not queue[tail], "Queue size overflow on Queue #" .. obj)
        queue[tail] = item
        tail = (tail % length) + 1
    end

    function obj.dequeue()
        local item = queue[head]
        queue[head] = false
        head = (head % length) + 1
        return item
    end

    return obj
end

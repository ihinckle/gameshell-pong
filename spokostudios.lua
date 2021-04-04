Sos = {}

function Sos.getBottom(obj)
    return obj.y+obj.height
end

function Sos.getRight(obj)
    return obj.x+obj.width
end

function Sos.getMiddle(obj)
    return (obj.y+Sos.getBottom(obj))/2
end
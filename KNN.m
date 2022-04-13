function [outputRoad, outputCost] = KNN(inputAdjacencyMatrix)
%KNN算法，贪心思想，每次都找最短的路线，输入邻接矩阵，输出路线与运行代价
row = size(inputAdjacencyMatrix, 1);
outputRoad = [];%输出路径
outputCost = 0;%输出总长度
havePass = zeros(1, row);%标记点是否被走过
nextPoint = 1;%确定开始点
haveNumber = 0;%确定已走路程
while haveNumber < row
    havePass(1, nextPoint) = 1;
    outputRoad = [outputRoad, nextPoint];
    min = 0;
    haveNumber = haveNumber + 1;
    for i = 1:row%确定起始搜索点
        if havePass(1, i) == 0
            min = inputAdjacencyMatrix(nextPoint, i);
            break
        end
    end
   tem = nextPoint;
    for i = 1:row%找到最短的路径
        if havePass(1, i) == 0 && inputAdjacencyMatrix(tem, i) <= min
            min = inputAdjacencyMatrix(tem, i);
            nextPoint = i;
        end
    end
    outputCost = outputCost + min;
end
outputRoad = [outputRoad , 1];%与第一个点连接起来
outputCost = outputCost + inputAdjacencyMatrix(row, 1);
end
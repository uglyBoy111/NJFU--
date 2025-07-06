//上课时间接口
interface Time {
  week: number[]
  day:number
  Start_order:number
  End_order:number
}

//课程接口
interface Course {
  name: string
  time: Time
  teaching_building:string
  floor:number
  classroom: string
  teacher:string
}

interface Floors{
  index:number
  rooms:string[]
}

interface Teaching_building{
  name:string
  floors:Floors[]
}

//教室
// 定义两个教学楼

let main_building:Teaching_building={
  name:'教学主楼',
  floors:[
    {index:1,rooms:['1101','1102','1103','1104','1105','1106']},
    {index:2,rooms:['2101','2102','2103','2104','2105','2106']}
  ]
}

let fifth_building:Teaching_building={
  name:'教学五楼',
  floors:[
    {index:1,rooms:['5101','5102','5103','5104','5105','5106']},
    {index:2,rooms:['5101','5102','5103','5104','5105','5106']}
  ]
}

// 创建一个数组来存教学楼
const Classrooms = [main_building,fifth_building];
const p=Classrooms
//创建课程实例
let gailvtongji: Course = {
  name: '概率统计',
  time: {
    week: [1, 2, 3, 4, 5, 6, 7, 8,9,10,11,12],
    day:5,
    Start_order:5,
    End_order:8
  },
  teaching_building:Classrooms[0].name,
  floor:Classrooms[0].floors[0].index,
  classroom: Classrooms[0].floors[0].rooms[0],
  teacher:'vv'
}


let shuxuefenxi: Course = {
  name: '数学分析',
  time: {
    week: [1, 2, 3, 4, 5, 6, 7, 8,9,10,11,12],
    day:4,
    Start_order:5,
    End_order:8
  },
  teaching_building:Classrooms[0].name,
  floor:Classrooms[0].floors[0].index,
  classroom: main_building.floors[0].rooms[2],
  teacher:'徐爱军'
}

let genshin: Course = {
  name: '原神启动',
  time: {
    week: [1, 2, 3, 4, 5, 6, 7, 8,9,10,11,12],
    day:1,
    Start_order:7,
    End_order:8
  },
  teaching_building:Classrooms[0].name,
  floor:Classrooms[0].floors[0].index,
  classroom: main_building.floors[0].rooms[4],
  teacher:'刘小天'
}

let filmtaste: Course = {
  name: '影视鉴赏',
  time: {
    week: [1, 2, 3, 4, 5, 6, 7, 8,9,10,11,12],
    day:1,
    Start_order:9,
    End_order:11
  },
  teaching_building:Classrooms[0].name,
  floor:Classrooms[0].floors[1].index,
  classroom: main_building.floors[1].rooms[0],
  teacher:'王某某'
}

let Cyuyan: Course = {
  name: '人体生理学',
  time: {
    week: [1, 2, 3, 4, 5, 6, 7, 8],
    day:1,
    Start_order:1,
    End_order:2
  },
  teaching_building:Classrooms[0].name,
  floor:Classrooms[0].floors[1].index,
  classroom: main_building.floors[1].rooms[2],
  teacher:'梁串串'
}


let makeszhuyi: Course = {
  name: '马克思主义',
  time: {
    week: [1, 2, 3, 4, 5, 6, 7, 8],
    day:6,
    Start_order:1,
    End_order:4
  },
  teaching_building:Classrooms[0].name,
  floor:Classrooms[0].floors[1].index,
  classroom: main_building.floors[1].rooms[4],
  teacher:'王瑞为'
}


let Sport: Course = {
  name: '体育',
  time: {
    week: [1, 2, 3, 4, 5, 6, 7, 8],
    day:2,
    Start_order:1,
    End_order:2
  },
  teaching_building:Classrooms[1].name,
  floor:Classrooms[1].floors[0].index,
  classroom: fifth_building.floors[0].rooms[0],
  teacher:'陈常增'
}

let physictest: Course = {
  name: '物理实验',
  time: {
    week: [2, 3, 4, 5, 6, 7, 8,9,10,11,12,13],
    day:2,
    Start_order:5,
    End_order:6
  },
  teaching_building:Classrooms[1].name,
  floor:Classrooms[1].floors[0].index,
  classroom: fifth_building.floors[0].rooms[2],
  teacher:'陈常增'
}

let English: Course = {
  name: '英语',
  time: {
    week: [1, 2, 3, 4, 5, 6, 7, 8],
    day:6,
    Start_order:5,
    End_order:6
  },
  teaching_building:Classrooms[1].name,
  floor:Classrooms[1].floors[0].index,
  classroom: fifth_building.floors[0].rooms[4],
  teacher:'杨喜刚'
}

let Database: Course = {
  name: '数据库原理与应用',
  time: {
    week: [1, 2, 3, 4, 5, 6],
    day:5,
    Start_order:1,
    End_order:4
  },
  teaching_building:Classrooms[1].name,
  floor:Classrooms[1].floors[1].index,
  classroom: fifth_building.floors[1].rooms[0],
  teacher:'张雪峰'
}

let advanced_math: Course = {
  name: '高等数学',
  time: {
    week: [1, 2, 3, 4, 5, 6,7,8,9,10,11,12,13,14,15,16],
    day:4,
    Start_order:1,
    End_order:2
  },
  teaching_building:Classrooms[1].name,
  floor:Classrooms[1].floors[1].index,
  classroom: fifth_building.floors[1].rooms[2],
  teacher:'魏伟'
}

let linear_algebra: Course = {
  name: '线性代数',
  time: {
    week: [1, 2, 3, 4, 5, 6,7,8,9,10,11,12],
    day:3,
    Start_order:5,
    End_order:6
  },
  teaching_building:Classrooms[1].name,
  floor:Classrooms[1].floors[1].index,
  classroom:fifth_building.floors[1].rooms[4],
  teacher:'魏伟'
}

//课程
let courses: Course[] = [English,Database,advanced_math,linear_algebra,Sport,physictest,makeszhuyi,Cyuyan,filmtaste,genshin,shuxuefenxi,gailvtongji]

//导出课程对象数组
export {courses,Classrooms,Course,Teaching_building,p}

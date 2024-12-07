from pymongo import MongoClient


# connect with ongo DB on port 271017
client = MongoClient('mongodb://localhost:27017')


# connect with database named as 'dbda'
db = client['dbda']

# connect with collection named as  'dbda'
emp = db['emp']


def getAllEmpInfo():
    # Print all the employees data from emp collection
    cursor = emp.find()


    # Print all the employees data from emp collection

    for e in cursor:
        # print(e)
        print(e['_id'],"-",e['ename'],"-",e['job'])


# getAllEmpInfo()


# --------------------------------------



#  print info of all manager from emp colleciton usning python function


def getAllManagers():
    criteria = {'job': "MANAGER"}
    cursor = emp.find(criteria)

    for e in cursor:
        print(e['_id'],"-",e['ename'],"-",e['job'],"-",e['sal'])

# getAllManagers()


# ------------------------------------

#  add new employee  

def insertEmp():
    criteria = {"_id" : 101 , "ename" : 'nita', "job" : "MANAGER"}
    cursor = emp.insert_one(criteria)
    print("emp added succesfully")


# insertEmp()
# getAllManagers()



# -----------------------------------


def delEmp():
    criteria = {"_id" : 7566}
    cc = emp.delete_one(criteria)
    print("removed")

# delEmp()


# ------------------------------


# change name of emp id 101 as  "Neeta"

def updEmp():
    emp.update_one({'_id':101}, {'$set': {'ename':'Neeta'}})
    print("name updated")


# updEmp()


# ----------------------------------------------


# print name and al of all emp sorted by sal using aggregation pipeline


def pipeline_sort():
    res = emp.aggregate([
        {
            '$sort' : {'sal' : 1}
        },{
            '$project' : {'ename' : 1, 'sal' : 1, '_id' : 0}
        }
    ])
    
    print("sorting done")
    for e in res:
        print(e)


# pipeline_sort()


# --- BETTER way

def pipeline_2_sort():
    pipeline = [
        {
            '$sort' : {'sal' : 1}
        },{
            '$project' : {'ename' : 1, 'sal' : 1, '_id' : 0}
        }
    ]
   
    res = emp.aggregate(pipeline) 
    print("sorting done")
    for e in res:
        print(e)


pipeline_2_sort()
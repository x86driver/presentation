#include <iostream>
#include <stdio.h>
using namespace std;

class Parent {
public:
	virtual void print() = 0;
};

class Children : public Parent {
public:
	virtual void print() {
		cout << "Children!" << endl;
	}
};

int main()
{
	Parent *p = new Children;
	p->print();
	delete p;

	return 0;
}


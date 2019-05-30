#include<iostream>
using namespace std;

template<class T>
struct Node
{
	T data;
	Node<T>* next;
};

template<class T>
class Cll
{
	Node<T>*tail;
public:
	Cll()
	{
		tail = nullptr;
	}

	void addelement(T val)
	{
		Node<T>*newnode;
		newnode = new Node<T>;
		newnode->data = val;
		newnode->next = nullptr;
		if (tail == nullptr)
		{
			tail = newnode;
			newnode->next = tail;
		}
		else
		{
			newnode->next = tail->next;
			tail->next = newnode;
			tail = newnode;
		}
	}

	void display()
	{
		Node<T>*temp = tail->next;
		while (temp != nullptr)
		{
			cout << temp->data << endl;
			temp = temp->next;
			if (tail->next == temp)
				break;
		}
	}
	/*~Cll()
	{
		Node<T>* temp = tail->next;
		while (1)
		{
			if (temp == nullptr)
			{
				break;
			}
			temp = temp->next;
			delete tail->next;
			tail->next = temp;
			
		}
	}*/



};

int main()
{
	Cll<int>cll;
	cll.addelement(10);
	cll.addelement(15);
	cll.addelement(20);
	cll.addelement(25);
	cll.addelement(30);

	cll.display();

	return 0;
}
# User Stories to a Domain Model

```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working
```

| Objects         | Messages         |
|-----------------|------------------|
| Person          | username_display |
| Person          | ride_bike?       |
| Bike            | working?         |
| DockingStation  | release_bike     |

```
person <-- username_display --> username
person <-- ride_bike? --> true/false
bike <-- works? --> true/false
docking station <-- release_bike --> true/false
```

## Challenge #11 User Stories
```
As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station

As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked
```
| Objects         | Messages          |
|-----------------|-------------------|
| Person          | return_bike       |
| Bike            | docked?           |
| DockingStation  | dock              |

```
person <-- return_bike --> true/false
bike <-- docked? --> true/false
DockingStation <-- dock --> true/false
```

## Challenge #12 User Stories
```
As a member of the public,
So that I am not confused and charged unnecessarily,
I'd like docking stations not to release bikes when there are none available.

```
| Objects         | Messages          |
|-----------------|-------------------|
| Person          |                   |
| Bike            |                   |
| DockingStation  | release_bike      |

```
DockingStation <-- release_bike --> true/false
```

## Challenge #13 User Stories
```
As a maintainer of the system,
So that I can control the distribution of bikes,
I'd like docking stations not to accept more bikes than their capacity.
```
| Objects         | Messages          |
|-----------------|-------------------|
| Maintainer      |                   |
| Bike            |                   |
| DockingStation  | dock              |

```
DockingStation <-- dock --> true/false
```
## Challenge #14 User Stories
```
As a system maintainer,
So that I can plan the distribution of bikes,
I want a docking station to have a default capacity of 20 bikes.
```
| Objects         | Messages          |
|-----------------|-------------------|
| Maintainer      |                   |
| Bike            |                   |
| DockingStation  | dock              |

```
DockingStation <-- dock --> true/false
```

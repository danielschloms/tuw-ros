import json
import sys

if __name__ == "__main__":

    filename = "./graph.json"
    if len(sys.argv) > 1:
        filename = sys.argv[1]

    DEFAULT_ORIENTATION = {
        "x": 0.0,
        "y": 0.0,
        "z": 0.0,
        "w": 1.0
    }

    # node: (id, (x, y))
    nodes = [(1, (-1.0, 0.0)),
             (2, (0.0, 0.0)),
             (3, (1.0, 0.0)),
             (4, (0.0, 1.0))]

    # edge: (start node, end node)
    edges = [(0, (1, 2)),
             (1, (2, 3)),
             (2, (2, 4))]

    graph = {
        "origin": {
            "position": {
                "x": 0.0,
                "y": 0.0,
                "z": 0.0,
            },
            "orientation": DEFAULT_ORIENTATION
        },
        # "nodes" : [{"id" : id} for id, position in nodes]
        "nodes": [{
            "id": id,
            "valid": 1,
            "pose": {
                "position": {
                    "x": position[0],
                    "y": position[1],
                    "z": 0.0},
                "orientation": DEFAULT_ORIENTATION
            },
            "flags": []
        } for id, position in nodes
        ],
        "edges": [{
            "id": id,
            "valid": 1,
            "weight": 1.0,
            "flags": [],
            "start": edge_nodes[0],
            "end": edge_nodes[1],
            "path": []
        } for id, edge_nodes in edges
        ]
    }

    with open(filename, "w+") as graphfile:
        json.dump(graph, graphfile)
